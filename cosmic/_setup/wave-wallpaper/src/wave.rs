//! Fresh's wave screensaver (`WaveEffect` in fresh-editor's
//! src/view/animation.rs) as a standalone frame renderer: same tide physics
//! (rise, growing swell, words flung off the crest and sinking), with code
//! words launched on a schedule so the steady state loops seamlessly.
//!
//! Ported from the Fresh editor (https://github.com/sinelaw/fresh).
//!
//! Frames are RGBA8, `width * height * 4` bytes.

use std::f32::consts::TAU;

// ---- tunables (CLI-overridable) -------------------------------------------
#[derive(Clone)]
pub struct Cfg {
    pub width: usize,
    pub height: usize,
    pub cell_w: usize,
    pub cell_h: usize,
    pub fps: u32,
    pub loop_secs: f32,
    pub rate: f32,
    pub sky: (u8, u8, u8),
    /// Launch code words off the crests.
    pub words: bool,
    /// Random bubbles in the water body.
    pub bubbles: bool,
    /// Wave height multiplier (1.0 = Fresh's original swell).
    pub amp: f32,
    /// Multiplier for the two short, choppy wave components only
    /// (below 1.0 rounds the swell off).
    pub chop: f32,
    /// Water colour at the surface / in the depths.
    pub sea: (u8, u8, u8),
    pub deep: (u8, u8, u8),
    /// Crest cell tint, crest glyphs, bubbles, inner ripple lines (near/far).
    pub crest: (u8, u8, u8),
    pub foam: (u8, u8, u8),
    pub bubble: (u8, u8, u8),
    pub ripple_hi: (u8, u8, u8),
    pub ripple_lo: (u8, u8, u8),
    /// Float a pirate ship, drawn in characters, on the water.
    pub ship: bool,
    /// Ship centre as a fraction of the width.
    pub ship_x: f32,
    /// Whole screen crossings per loop (0 = stays put, negative = leftwards).
    pub ship_laps: i32,
}

impl Default for Cfg {
    fn default() -> Self {
        Cfg {
            width: 1920,
            height: 1200,
            cell_w: 12,
            cell_h: 24,
            fps: 30,
            loop_secs: 120.0,
            rate: 1.75,
            sky: (0x28, 0x28, 0x28),
            words: true,
            bubbles: true,
            amp: 1.0,
            chop: 1.0,
            sea: (38, 132, 205),
            deep: (6, 26, 68),
            crest: (70, 170, 228),
            foam: (210, 245, 255),
            bubble: (150, 205, 235),
            ripple_hi: (190, 235, 255),
            ripple_lo: (40, 120, 190),
            ship: false,
            ship_x: 0.5,
            ship_laps: 0,
        }
    }
}

// ---- wave model (constants from WaveEffect) --------------------------------
const MAX_LEVEL_FRAC: f32 = 0.5;
const RISE_SECS: f32 = 1.6;
const AMP_BASE: f32 = 0.4;
const AMP_GROWTH: f32 = 0.6;
const AMP_MAX: f32 = 12.0;
/// From here on the tide is stationary (level risen, amplitude capped).
const STEADY_FROM: f32 = (AMP_MAX - AMP_BASE) / AMP_GROWTH;
/// Longest a launched word lives (flight + sink + rest on the seabed).
const MAX_LIFE: f32 = 24.0;
/// Start of the seamless loop: late enough that every word alive at this
/// instant was launched into the stationary tide.
pub const LOOP_START: f32 = 44.0;
const GRAVITY: f32 = 24.0;
const LAUNCH_UP_MIN: f32 = 12.0;
const LAUNCH_UP_VAR: f32 = 10.0;
const LAUNCH_SIDE: f32 = 7.0;
const SINK_SPEED: f32 = 2.2;
const K1: f32 = 0.157;
const K2: f32 = 0.370;
const K3: f32 = 0.785;
const A1: f32 = 1.0;
const A2: f32 = 0.55;
const A3: f32 = 0.28;
const SWING_A: f32 = 1.6;
const LAYERS: usize = 3;
const LAYER_SPACING: f32 = 2.3;
const CREST: [char; 3] = ['~', '≈', '∿'];

/// Original angular frequencies, snapped to whole cycles per loop.
struct Freqs {
    w1: f32,
    w2: f32,
    w3: f32,
    swing: f32,
}

impl Freqs {
    fn new(loop_secs: f32) -> Self {
        let snap = |w: f32| {
            let n = (w * loop_secs / TAU).round().max(1.0);
            n * TAU / loop_secs
        };
        Freqs { w1: snap(1.95), w2: snap(2.95), w3: snap(1.19), swing: snap(1.70) }
    }
}

struct Wave {
    f: Freqs,
    rows: f32,
    amp: f32,
    chop: f32,
    sea: (u8, u8, u8),
    deep: (u8, u8, u8),
}

fn smoothstep(x: f32) -> f32 {
    let x = x.clamp(0.0, 1.0);
    x * x * (3.0 - 2.0 * x)
}

impl Wave {
    /// `WaveEffect::level_amp`, returning (water_top_mean, amp).
    fn top_amp(&self, t: f32) -> (f32, f32) {
        let level = smoothstep((t / RISE_SECS).min(1.0)) * MAX_LEVEL_FRAC * self.rows;
        let amp = (AMP_BASE + AMP_GROWTH * t).min(AMP_MAX) * self.amp;
        (self.rows - level, amp)
    }

    fn undulation(&self, x: f32, t: f32, lp: f32) -> f32 {
        self.top_amp(t).1
            * (A1 * (K1 * x + self.f.w1 * t + lp).sin()
                + A2 * self.chop * (K2 * x - self.f.w2 * t + lp * 1.7).sin()
                + A3 * self.chop * (K3 * x + self.f.w3 * t + lp * 0.5).sin())
    }
    fn swing(&self, t: f32) -> f32 {
        self.top_amp(t).1 * SWING_A * (self.f.swing * t).sin()
    }
    fn surface_at(&self, x: f32, t: f32) -> f32 {
        self.top_amp(t).0 - self.undulation(x, t, 0.0) - self.swing(t)
    }
    fn water_rgb(&self, depth: f32) -> (u8, u8, u8) {
        lerp_rgb(self.sea, self.deep, (depth / 14.0).clamp(0.0, 1.0))
    }
}

fn lerp_rgb(a: (u8, u8, u8), b: (u8, u8, u8), f: f32) -> (u8, u8, u8) {
    let f = f.clamp(0.0, 1.0);
    let m = |a: u8, b: u8| (a as f32 + (b as f32 - a as f32) * f).round() as u8;
    (m(a.0, b.0), m(a.1, b.1), m(a.2, b.2))
}

fn hash01(x: f32, y: f32) -> f32 {
    let xi = x as i64;
    let yi = y as i64;
    let mut h = (xi.wrapping_mul(73_856_093) ^ yi.wrapping_mul(19_349_663)) as u64;
    h ^= h >> 13;
    h = h.wrapping_mul(0x9E37_79B9_7F4A_7C15);
    h ^= h >> 16;
    (h & 0xFFFF) as f32 / 65_536.0
}

// ---- scheduled words --------------------------------------------------------
const VOCAB: &[(&str, (u8, u8, u8))] = &[
    ("fn", (198, 120, 221)), ("let", (198, 120, 221)), ("mut", (198, 120, 221)),
    ("impl", (198, 120, 221)), ("pub", (198, 120, 221)), ("match", (198, 120, 221)),
    ("struct", (198, 120, 221)), ("WaveEffect", (229, 192, 123)), ("Buffer", (229, 192, 123)),
    ("Duration", (229, 192, 123)), ("surface_at", (97, 175, 239)), ("undulation", (97, 175, 239)),
    ("step()", (97, 175, 239)), ("paint_water", (97, 175, 239)), ("\"fresh\"", (152, 195, 121)),
    ("\"~≈∿\"", (152, 195, 121)), ("0.157", (209, 154, 102)), ("24.0", (209, 154, 102)),
    ("// TODO", (92, 99, 112)), ("// wave", (92, 99, 112)), ("{", (171, 178, 191)),
    ("}", (171, 178, 191)), ("=>", (86, 182, 194)), ("&mut self", (224, 108, 117)),
    ("Ok(())", (171, 178, 191)), ("Some(x)", (171, 178, 191)), ("crest", (224, 108, 117)),
    ("particles", (224, 108, 117)), ("GRAVITY", (209, 154, 102)), ("Vec<Word>", (229, 192, 123)),
];

struct Glyph {
    ch: char,
    fg: (u8, u8, u8),
    /// (x, y, sinking) per sample at `SIM_HZ`, starting at launch.
    track: Vec<(f32, f32, bool)>,
}

struct Sched {
    t0: f32,
    glyphs: Vec<Glyph>,
}

const SIM_HZ: f32 = 120.0;

/// Launch times: the loop's own launches in [LOOP_START, LOOP_START+L)
/// (their copies one loop earlier play in the intro, so the intro hands
/// over to the loop seamlessly), plus intro-only launches during the
/// rising tide that are gone before the loop starts.
fn launch_times(c: &Cfg) -> Vec<f32> {
    let mut v = Vec::new();
    let n = (c.loop_secs * c.rate).round() as usize;
    for i in 0..n {
        let t0 = LOOP_START + hash01(i as f32 * 7.0 + 1.0, 3.0) * c.loop_secs;
        v.push(t0);
        if t0 - c.loop_secs > LOOP_START - MAX_LIFE {
            v.push(t0 - c.loop_secs);
        }
    }
    let intro_end = LOOP_START - MAX_LIFE;
    let m = ((intro_end - RISE_SECS) * c.rate).max(0.0) as usize;
    for i in 0..m {
        v.push(RISE_SECS + hash01(i as f32 * 5.0 + 2.0, 9.0) * (intro_end - RISE_SECS));
    }
    v
}

fn build_schedule(c: &Cfg, wave: &Wave, cols: f32, rows: f32) -> Vec<Sched> {
    let bottom = rows - 1.0;
    let mut out = Vec::new();
    if !c.words {
        return out;
    }
    for t0 in launch_times(c) {
        // Same word for a launch and its one-loop-earlier copy.
        let fi = ((t0 - LOOP_START).rem_euclid(c.loop_secs) * 1000.0).round();
        let (text, fg) = VOCAB[(hash01(fi, 11.0) * VOCAB.len() as f32) as usize % VOCAB.len()];
        let n = text.chars().count() as f32;
        let x0 = 2.0 + hash01(fi * 13.0, 5.0) * (cols - n - 4.0).max(1.0);
        let r = hash01(x0, fi);
        let r2 = hash01(fi, x0);
        let vy0 = -(LAUNCH_UP_MIN + r * LAUNCH_UP_VAR);
        let vx0 = (r2 - 0.5) * 2.0 * LAUNCH_SIDE;
        // The word starts sitting on the crest at its launch instant.
        let crest = (0..text.chars().count())
            .map(|k| wave.surface_at(x0 + k as f32, t0))
            .fold(f32::INFINITY, f32::min);
        let y0 = crest - 0.5;
        let max_life = MAX_LIFE;
        let dt = 1.0 / SIM_HZ;
        let glyphs = text
            .chars()
            .enumerate()
            .map(|(k, ch)| {
                let home_x = x0 + k as f32;
                let (mut x, mut y, mut vx, mut vy) = (home_x, y0, vx0, vy0);
                let mut sinking = false;
                let mut track = Vec::new();
                let mut age = 0.0;
                let mut settled = 0.0;
                while age < max_life {
                    track.push((x, y, sinking));
                    let t = t0 + age;
                    if !sinking {
                        vy += GRAVITY * dt;
                        x += vx * dt;
                        y += vy * dt;
                        let surf = wave.surface_at(x, t);
                        if vy > 0.0 && y >= surf {
                            sinking = true;
                            y = surf;
                            vx *= 0.3;
                        }
                    } else {
                        vx *= (1.0 - 2.0 * dt).max(0.0);
                        x += vx * dt + 0.6 * (t * 1.3 + home_x).sin() * dt;
                        y += SINK_SPEED * dt;
                        if y >= bottom {
                            y = bottom;
                            settled += dt;
                            // Rest on the seabed a moment, then dissolve.
                            if settled > 2.5 || age > MAX_LIFE - 0.1 {
                                break;
                            }
                        }
                    }
                    age += dt;
                }
                Glyph { ch, fg, track }
            })
            .collect();
        out.push(Sched { t0, glyphs });
    }
    out
}

// ---- cell grid + rasteriser -------------------------------------------------
#[derive(Clone, Copy)]
struct Cell {
    ch: char,
    fg: (u8, u8, u8),
    bg: (u8, u8, u8),
}

struct Raster {
    fonts: Vec<fontdue::Font>,
    px: f32,
    cell_w: usize,
    cell_h: usize,
    cache: std::collections::HashMap<char, (fontdue::Metrics, Vec<u8>)>,
    ascent: f32,
}

impl Raster {
    /// `None` if no usable font is found (callers fall back to a still).
    fn new(cell_w: usize, cell_h: usize) -> Option<Self> {
        // JetBrains Mono first (user or system install); the others fill in
        // any glyph it lacks.
        let home = std::env::var("HOME").unwrap_or_default();
        let paths = [
            format!("{home}/.local/share/fonts/JetBrainsMono/JetBrainsMono-Regular.ttf"),
            "/usr/share/fonts/jetbrains-mono-fonts/JetBrainsMono-Regular.ttf".into(),
            "/usr/share/fonts/TTF/JetBrainsMono-Regular.ttf".into(), // Arch
            "/usr/share/fonts/adwaita-mono-fonts/AdwaitaMono-Regular.ttf".into(),
            "/usr/share/fonts/liberation-mono-fonts/LiberationMono-Regular.ttf".into(),
            "/usr/share/fonts/dejavu-sans-fonts/DejaVuSans.ttf".into(),
            "/usr/share/fonts/Adwaita/AdwaitaMono-Regular.ttf".into(),
            "/usr/share/fonts/liberation/LiberationMono-Regular.ttf".into(),
            "/usr/share/fonts/TTF/DejaVuSans.ttf".into(),
        ];
        let fonts: Vec<_> = paths
            .iter()
            .filter_map(|p| std::fs::read(p).ok())
            .filter_map(|b| fontdue::Font::from_bytes(b, fontdue::FontSettings::default()).ok())
            .collect();
        let px = cell_h as f32 * 0.78;
        let lm = fonts.first()?.horizontal_line_metrics(px)?;
        let ascent = (cell_h as f32 - (lm.ascent - lm.descent)) / 2.0 + lm.ascent;
        Some(Raster { fonts, px, cell_w, cell_h, cache: Default::default(), ascent })
    }

    fn glyph(&mut self, ch: char) -> &(fontdue::Metrics, Vec<u8>) {
        let px = self.px;
        let fonts = &self.fonts;
        self.cache.entry(ch).or_insert_with(|| {
            let f = fonts.iter().find(|f| f.lookup_glyph_index(ch) != 0).unwrap_or(&fonts[0]);
            f.rasterize(ch, px)
        })
    }

    fn draw(&mut self, frame: &mut [u8], w: usize, h: usize, cx: usize, cy: usize, cell: Cell) {
        let (ox, oy) = (cx * self.cell_w, cy * self.cell_h);
        for y in 0..self.cell_h {
            for x in 0..self.cell_w {
                let (px, py) = (ox + x, oy + y);
                if px < w && py < h {
                    let o = (py * w + px) * 4;
                    frame[o..o + 4].copy_from_slice(&[cell.bg.0, cell.bg.1, cell.bg.2, 255]);
                }
            }
        }
        if cell.ch == ' ' {
            return;
        }
        let (cw, ascent) = (self.cell_w as i32, self.ascent);
        let (m, bmp) = self.glyph(cell.ch);
        let gx = ox as i32 + (cw - m.width as i32) / 2;
        let gy = oy as i32 + (ascent - m.height as f32 - m.ymin as f32).round() as i32;
        for y in 0..m.height {
            for x in 0..m.width {
                let a = bmp[y * m.width + x] as f32 / 255.0;
                if a == 0.0 {
                    continue;
                }
                let (px, py) = (gx + x as i32, gy + y as i32);
                if px < 0 || py < 0 || px as usize >= w || py as usize >= h {
                    continue;
                }
                let o = (py as usize * w + px as usize) * 4;
                let c = lerp_rgb((frame[o], frame[o + 1], frame[o + 2]), cell.fg, a);
                frame[o..o + 3].copy_from_slice(&[c.0, c.1, c.2]);
            }
        }
    }
    /// One character with its top-left cell corner at pixel (x, y), off the
    /// grid. `bg` fills the cell first.
    #[allow(clippy::too_many_arguments)]
    fn blit(
        &mut self,
        frame: &mut [u8],
        w: usize,
        h: usize,
        x: i32,
        y: i32,
        ch: char,
        fg: (u8, u8, u8),
        bg: Option<(u8, u8, u8)>,
    ) {
        let inside = |px: i32, py: i32| px >= 0 && py >= 0 && (px as usize) < w && (py as usize) < h;
        if let Some(bg) = bg {
            for py in y..y + self.cell_h as i32 {
                for px in x..x + self.cell_w as i32 {
                    if inside(px, py) {
                        let o = (py as usize * w + px as usize) * 4;
                        frame[o..o + 3].copy_from_slice(&[bg.0, bg.1, bg.2]);
                    }
                }
            }
        }
        if ch == ' ' {
            return;
        }
        let (cw, ascent) = (self.cell_w as i32, self.ascent);
        let (m, bmp) = self.glyph(ch);
        let gx = x + (cw - m.width as i32) / 2;
        let gy = y + (ascent - m.height as f32 - m.ymin as f32).round() as i32;
        for iy in 0..m.height {
            for ix in 0..m.width {
                let a = bmp[iy * m.width + ix] as f32 / 255.0;
                let (px, py) = (gx + ix as i32, gy + iy as i32);
                if a == 0.0 || !inside(px, py) {
                    continue;
                }
                let o = (py as usize * w + px as usize) * 4;
                let c = lerp_rgb((frame[o], frame[o + 1], frame[o + 2]), fg, a);
                frame[o..o + 3].copy_from_slice(&[c.0, c.1, c.2]);
            }
        }
    }
}

#[derive(Clone, Copy, PartialEq)]
struct CellKey(char, (u8, u8, u8), (u8, u8, u8));

pub struct WaveRenderer {
    c: Cfg,
    cols: usize,
    rows: usize,
    wave: Wave,
    sched: Vec<Sched>,
    ship: Option<Ship>,
    surf: Vec<f32>,
    raster: Raster,
    grid: Vec<Cell>,
    prev: Vec<Option<CellKey>>,
    frame: Vec<u8>,
}

impl WaveRenderer {
    /// `None` if no font could be loaded.
    pub fn new(c: Cfg) -> Option<Self> {
        const { assert!(STEADY_FROM + MAX_LIFE <= LOOP_START) };
        let cols = c.width.div_ceil(c.cell_w);
        let rows = c.height.div_ceil(c.cell_h);
        let wave = Wave {
            f: Freqs::new(c.loop_secs),
            rows: rows as f32,
            amp: c.amp,
            chop: c.chop,
            sea: c.sea,
            deep: c.deep,
        };
        let ship = c.ship.then(|| Ship::new(&c, &wave, cols as f32));
        let sched = build_schedule(&c, &wave, cols as f32, rows as f32);
        let raster = Raster::new(c.cell_w, c.cell_h)?;
        let sky = Cell { ch: ' ', fg: c.sky, bg: c.sky };
        Some(WaveRenderer {
            grid: vec![sky; cols * rows],
            prev: vec![None; cols * rows],
            frame: vec![0; c.width * c.height * 4],
            c,
            cols,
            rows,
            wave,
            sched,
            ship,
            surf: vec![0.0; cols],
            raster,
        })
    }

    pub fn width(&self) -> usize {
        self.c.width
    }

    pub fn height(&self) -> usize {
        self.c.height
    }

    /// Seconds in the full timeline: intro, then one loop.
    pub fn timeline_secs(&self) -> f32 {
        LOOP_START + self.c.loop_secs
    }

    /// Map wall-clock seconds since the effect started onto the timeline:
    /// the intro plays once, then the steady section loops forever.
    pub fn wrap_time(&self, secs: f32) -> f32 {
        if secs < LOOP_START {
            secs
        } else {
            LOOP_START + (secs - LOOP_START) % self.c.loop_secs
        }
    }

    /// Render the frame at timeline time `t` (seconds). Only cells that
    /// changed since the previous call are re-rasterised.
    pub fn render(&mut self, t: f32) -> &[u8] {
        let (cols, rows) = (self.cols, self.rows);
        let rowsf = rows as f32;
        let c = &self.c;
        let wave = &self.wave;
        let grid = &mut self.grid;
        let foam = c.foam;
        let sky = Cell { ch: ' ', fg: c.sky, bg: c.sky };
        grid.fill(sky);
        let put = |grid: &mut Vec<Cell>, x: f32, y: f32, cell: Cell| {
            let (cx, cy) = (x.round(), y.round());
            if cx >= 0.0 && cy >= 0.0 && (cx as usize) < cols && (cy as usize) < rows {
                grid[cy as usize * cols + cx as usize] = cell;
            }
        };
        // Particle state for this frame (age wraps around the loop).
        let mut sinking = Vec::new();
        for s in &self.sched {
            let age = t - s.t0;
            if age < 0.0 {
                continue;
            }
            let idx = (age * SIM_HZ) as usize;
            for g in &s.glyphs {
                if let Some(&(x, y, sink)) = g.track.get(idx) {
                    if sink {
                        // Fade the last second on the seabed into the deep.
                        let left = (g.track.len() - idx) as f32 / SIM_HZ;
                        sinking.push((x, y, g.ch, g.fg, (left / 1.5).min(1.0)));
                    } else {
                        put(grid, x, y, Cell { ch: g.ch, fg: g.fg, bg: c.sky });
                    }
                }
            }
        }

        // Water body + crest foam + bubbles (paint_water).
        for dx in 0..cols {
            let x = dx as f32;
            let surf = wave.surface_at(x, t);
            self.surf[dx] = surf;
            for dy in 0..rows {
                let y = dy as f32;
                if y + 0.5 < surf {
                    continue;
                }
                let depth = y - surf;
                let body = wave.water_rgb(depth);
                let cell = &mut grid[dy * cols + dx];
                if depth < 0.9 {
                    let gi = ((x * 0.5 + t * 1.6).floor() as i64).rem_euclid(3) as usize;
                    *cell = Cell { ch: CREST[gi], fg: foam, bg: lerp_rgb(c.crest, body, 0.5) };
                } else if c.bubbles && hash01(x + (t * 1.5).floor(), y) > 0.95 {
                    *cell = Cell { ch: '∘', fg: c.bubble, bg: body };
                } else {
                    *cell = Cell { ch: ' ', fg: body, bg: body };
                }
            }
        }
        // Internal undulating layers.
        for layer in 1..=LAYERS {
            let lp = layer as f32 * 2.3;
            let base = layer as f32 * LAYER_SPACING;
            let fg = lerp_rgb(c.ripple_hi, c.ripple_lo, layer as f32 / (LAYERS as f32 + 1.0));
            for dx in 0..cols {
                let x = dx as f32;
                let surf = wave.surface_at(x, t);
                let ly = wave.top_amp(t).0 - wave.undulation(x, t, lp) - wave.swing(t) + base;
                if ly <= surf + 0.6 || ly < 0.0 || ly >= rowsf {
                    continue;
                }
                let row = ly.round() as usize;
                if row >= rows {
                    continue;
                }
                let gi = ((x * 0.4 + t * 1.2 + layer as f32).floor() as i64).rem_euclid(3) as usize;
                let cell = &mut grid[row * cols + dx];
                cell.ch = CREST[gi];
                cell.fg = fg;
            }
        }
        // Sinking glyphs, tinted by depth.
        for (x, y, ch, base, vis) in sinking {
            let depth = (y - wave.surface_at(x, t)).max(0.0);
            let bg = wave.water_rgb(depth + 0.5);
            let fg = lerp_rgb(bg, lerp_rgb(base, wave.water_rgb(depth), 0.55), vis);
            put(grid, x, y, Cell { ch, fg, bg });
        }

        for cy in 0..rows {
            for cx in 0..cols {
                let cell = self.grid[cy * cols + cx];
                let key = Some(CellKey(cell.ch, cell.fg, cell.bg));
                if self.prev[cy * cols + cx] != key {
                    self.prev[cy * cols + cx] = key;
                    self.raster.draw(&mut self.frame, self.c.width, self.c.height, cx, cy, cell);
                }
            }
        }
        if let Some(ship) = &self.ship {
            // Drawn in pixels over the grid, so every cell it touched is
            // re-rasterised next frame.
            let (x0, y0, x1, y1) = ship.draw(&mut self.frame, &mut self.raster, &self.c, t);
            for cy in y0 / self.c.cell_h..y1.div_ceil(self.c.cell_h).min(rows) {
                for cx in x0 / self.c.cell_w..x1.div_ceil(self.c.cell_w).min(cols) {
                    self.prev[cy * cols + cx] = None;
                }
            }
        }
        &self.frame
    }
}


// ---- pirate ship --------------------------------------------------------------
/// Ship in characters, bow to the right; the last row is its wake.
const SHIP: [&str; 9] = [
    r"                 |~",
    r"           |/    w",
    r"          / (   (|   \",
    r"         /( (/   |)  |\",
    r"  ____  ( (/    (|   | )  ,",
    r" |----\ (/ |    /|   |'\ /^;",
    r"\---*---Y--+-----+---+--/(",
    r" \------*---*--*---*--/",
    r"  '~~ ~~~~~~~~~~~~~~~",
];
const SHIP_W: usize = 28;
/// Art point that sits on the water: midships, on the design waterline.
const SHIP_PIVOT: (f32, f32) = (12.0, 7.4);
/// Rows of hull below the waterline at rest.
const SHIP_DRAFT: f32 = 0.9;
const SHIP_WAKE_ROW: usize = 8;
/// Hull length at the waterline, in cells.
const SHIP_HULL: f32 = 23.0;

/// Colours from the blackpearl palette, by part.
fn ship_rgb(row: usize, col: usize, ch: char) -> (u8, u8, u8) {
    const MAST: (u8, u8, u8) = (0x8c, 0x91, 0x8d);
    const HULL: (u8, u8, u8) = (0xb8, 0x97, 0x3f);
    const TRIM: (u8, u8, u8) = (0xd9, 0xb8, 0x5a);
    match (row, col, ch) {
        (SHIP_WAKE_ROW, ..) => (0x7f, 0xe0, 0xa0),         // wake: ghost green
        (_, _, '~') => (0x3c, 0xb3, 0x71),                 // flag: sea green
        (_, _, 'w') => TRIM,                               // crow's nest
        (_, 11 | 17 | 21, '|') => MAST,
        (4..=5, 22.., _) => MAST,                          // bowsprit
        (6.., _, '*') => (0x5f, 0xd1, 0xb5),               // lit ports
        (6.., _, 'Y' | '+') => TRIM,
        (6.., ..) | (4..=5, ..=6, _) => HULL,              // hull, stern castle
        _ => (0xe6, 0xec, 0xe7),                           // sails
    }
}

const SHIP_HZ: f32 = 240.0;
const SHIP_GRAVITY: f32 = 72.0;
/// How far below the mean water level it rides, in standard deviations of
/// the surface under the hull.
const SHIP_SINK: f32 = 0.25;
/// Until then the ship is simply carried by the rising tide.
const SHIP_FREE_FROM: f32 = RISE_SECS + 0.4;
/// Heave spring holding the hull to the water: natural frequency (rad/s)
/// and damping ratio.
const SHIP_HEAVE_W: f32 = 9.0;
const SHIP_HEAVE_ZETA: f32 = 0.6;
/// Pitch spring: natural frequency (rad/s) and damping ratio.
const SHIP_PITCH_W: f32 = 5.0;
const SHIP_PITCH_ZETA: f32 = 0.45;
const SHIP_MAX_PITCH: f32 = 0.26;
/// In the air: radians of pitch per row/s of vertical speed (before the
/// atan), and the limit.
const SHIP_AIR_PITCH: f32 = 0.05;
const SHIP_MAX_AIR_PITCH: f32 = 0.4;
/// Surge: how hard the ship slides down a wave face, and the mooring
/// spring/damper that brings it back.
const SHIP_SURGE_PUSH: f32 = 7.0;
const SHIP_SURGE_K: f32 = 1.2;
const SHIP_SURGE_DAMP: f32 = 1.3;

/// A rigid body floating on the wave: heave follows the mean water level
/// under the hull through a buoyancy spring (so it lags, overshoots, and
/// leaves the water when a crest drops away faster than gravity), pitch
/// follows the mean slope, and it surges a little down the wave faces.
/// The motion is integrated once up front and stored, so `render(t)` stays
/// a pure function of `t`.
struct Ship {
    /// (x offset in cells, waterline y in rows, pitch in radians) at `SHIP_HZ`.
    track: Vec<(f32, f32, f32)>,
    /// Resting centre (cells) and horizontal travel per second (cells).
    x0: f32,
    speed: f32,
    /// Width of the track it wraps around: the screen plus `half_extent`
    /// (a whole ship) off each edge.
    span: f32,
    half_extent: f32,
}

impl Ship {
    fn base_x(&self, t: f32) -> f32 {
        if self.speed == 0.0 {
            return self.x0;
        }
        // Wrap off one edge and back in at the other, half a ship outside.
        let lo = -self.half_extent;
        (self.x0 + self.speed * (t - LOOP_START) - lo).rem_euclid(self.span) + lo
    }

    fn new(c: &Cfg, wave: &Wave, cols: f32) -> Self {
        let aspect = c.cell_h as f32 / c.cell_w as f32;
        let half_hull = SHIP_HULL / 2.0;
        let draft = SHIP_DRAFT;
        let half_extent = SHIP_W as f32;
        let span = cols + 2.0 * half_extent;
        let mut ship = Ship {
            track: Vec::new(),
            x0: c.ship_x * cols,
            speed: c.ship_laps as f32 * span / c.loop_secs,
            span,
            half_extent,
        };
        // Mean level and least-squares slope (rows per cell) of the water
        // under the hull.
        const N: usize = 13;
        let under = |x: f32, t: f32| {
            let (mut sy, mut syy, mut sxy, mut sxx) = (0.0, 0.0, 0.0, 0.0);
            for i in 0..N {
                let o = (i as f32 / (N - 1) as f32 * 2.0 - 1.0) * half_hull;
                let y = wave.surface_at(x + o, t);
                sy += y;
                syy += y * y;
                sxy += o * y;
                sxx += o * o;
            }
            let mean = sy / N as f32;
            // Ride a little below the mean, so the keel stays wet over the
            // short troughs between the crests.
            let chop = (syy / N as f32 - mean * mean).max(0.0).sqrt();
            (mean + SHIP_SINK * chop, sxy / sxx)
        };
        let dt = 1.0 / SHIP_HZ;
        // Scaled with the swell so the ship hops as often on any `amp`.
        let gravity = SHIP_GRAVITY * c.amp;
        let i_loop = (LOOP_START * SHIP_HZ).round() as usize;
        let i_end = i_loop + (c.loop_secs * SHIP_HZ).round() as usize;
        let (mut xo, mut vx) = (0.0f32, 0.0f32);
        let (mut y, mut vy) = (under(ship.base_x(0.0), 0.0).0, 0.0f32);
        let (mut th, mut om) = (0.0f32, 0.0f32);
        let mut prev_level = y;
        for i in 0..=i_end {
            ship.track.push((xo, y, th));
            let t = i as f32 * dt;
            let (level, slope) = under(ship.base_x(t) + xo, t + dt);
            let v_level = (level - prev_level) / dt;
            prev_level = level;
            if t < SHIP_FREE_FROM {
                // Carried up by the rising tide rather than thrown by it.
                (y, vy) = (level, v_level);
            }
            let wet = ((y + draft - level) / draft).clamp(0.0, 1.0);
            let lift = SHIP_HEAVE_W * SHIP_HEAVE_W * (level - y)
                + 2.0 * SHIP_HEAVE_ZETA * SHIP_HEAVE_W * (v_level - vy);
            // The sea can push the hull up as hard as it likes but cannot
            // pull it down faster than it falls: off a sharp crest it flies.
            vy += lift.min(gravity) * dt;
            y += vy * dt;
            // Pitch towards the water's slope.
            let px_slope = slope * aspect;
            let afloat = (px_slope.atan() * 0.75).clamp(-SHIP_MAX_PITCH, SHIP_MAX_PITCH);
            // Airborne it points along its fall: bow up while rising, bow
            // down as it drops back.
            let flying = (vy * SHIP_AIR_PITCH).atan().clamp(-SHIP_MAX_AIR_PITCH, SHIP_MAX_AIR_PITCH);
            let target = afloat * wet + flying * (1.0 - wet);
            let k = SHIP_PITCH_W * SHIP_PITCH_W;
            om += (k * (target - th) - 2.0 * SHIP_PITCH_ZETA * SHIP_PITCH_W * om) * dt;
            th += om * dt;
            // Surge.
            vx += (SHIP_SURGE_PUSH * wet * px_slope.clamp(-1.5, 1.5) - SHIP_SURGE_K * xo - SHIP_SURGE_DAMP * vx) * dt;
            xo += vx * dt;
        }
        // The tide is periodic from STEADY_FROM on and the ship has long
        // forgotten the intro by LOOP_START, so the two ends of the loop
        // agree to within float noise; spread what is left over the loop so
        // the seam is exact.
        let (a, b) = (ship.track[i_loop], ship.track[i_end]);
        let n = (i_end - i_loop) as f32;
        for i in i_loop..=i_end {
            let f = (i - i_loop) as f32 / n;
            let p = &mut ship.track[i];
            p.0 -= (b.0 - a.0) * f;
            p.1 -= (b.1 - a.1) * f;
            p.2 -= (b.2 - a.2) * f;
        }
        ship.track[i_end] = ship.track[i_loop];
        ship
    }

    fn state(&self, t: f32) -> (f32, f32, f32) {
        let f = (t * SHIP_HZ).clamp(0.0, (self.track.len() - 1) as f32);
        let i = (f as usize).min(self.track.len() - 2);
        let (a, b, k) = (self.track[i], self.track[i + 1], f - i as f32);
        (a.0 + (b.0 - a.0) * k, a.1 + (b.1 - a.1) * k, a.2 + (b.2 - a.2) * k)
    }

    /// Paint the ship's characters into `frame`, over the rasterised grid,
    /// at pixel positions so it moves smoothly. Pitch is a shear: columns
    /// slide up or down and the glyphs stay upright. Returns the touched
    /// pixel rectangle (x0, y0, x1, y1), end-exclusive. Every character,
    /// wake included, is opaque and in front of the waves.
    fn draw(&self, frame: &mut [u8], raster: &mut Raster, c: &Cfg, t: f32) -> (usize, usize, usize, usize) {
        let (xo, y, th) = self.state(t);
        let (cw, chh) = (c.cell_w as f32, c.cell_h as f32);
        let left = (self.base_x(t) + xo - SHIP_PIVOT.0) * cw;
        let top = (y - SHIP_PIVOT.1) * chh;
        let slope = th.tan();
        let (mut bx0, mut by0, mut bx1, mut by1) = (c.width, c.height, 0usize, 0usize);
        for (r, line) in SHIP.iter().enumerate() {
            // The ship is solid: the gaps inside it hide the sea behind too.
            let lo = line.find(|ch| ch != ' ').unwrap();
            // (not the gap under the bowsprit)
            let hi = if (4..=5).contains(&r) { 23 } else { line.len() };
            for (u, ch) in line.chars().enumerate() {
                let solid = r != SHIP_WAKE_ROW && (ch != ' ' || (u >= lo && u < hi));
                if ch == ' ' && !solid {
                    continue;
                }
                let x = (left + u as f32 * cw).round() as i32;
                let dy = (u as f32 + 0.5 - SHIP_PIVOT.0) * cw * slope;
                let yy = (top + r as f32 * chh + dy).round() as i32;
                if x + c.cell_w as i32 <= 0 || yy + c.cell_h as i32 <= 0 || x >= c.width as i32 || yy >= c.height as i32 {
                    continue;
                }
                let bg = solid.then_some(c.sky);
                raster.blit(frame, c.width, c.height, x, yy, ch, ship_rgb(r, u, ch), bg);
                bx0 = bx0.min(x.max(0) as usize);
                by0 = by0.min(yy.max(0) as usize);
                bx1 = bx1.max(((x + c.cell_w as i32).max(0) as usize).min(c.width));
                by1 = by1.max(((yy + c.cell_h as i32).max(0) as usize).min(c.height));
            }
        }
        (bx0.min(bx1), by0.min(by1), bx1, by1)
    }
}

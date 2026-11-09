//! Renders the wave wallpaper (intro + one seamless loop) as raw RGBA
//! frames on stdout; pipe into ffmpeg with `-pix_fmt rgba`.
//!
//! With no arguments this is Fresh's wave in its original colours. Options
//! (all optional): `--width/--height/--cell-w/--cell-h/--fps`, `--loop SECS`,
//! `--rate WORDS_PER_SEC`, `--no-words`, `--no-bubbles`, `--amp SCALE`, `--chop SCALE`,
//! colours as `#rrggbb`: `--sky --sea --deep --crest --foam --bubble
//! --ripple-hi --ripple-lo`, the ship: `--ship [--ship-x FRAC] [--ship-laps N]`, and `--at SECS` to emit the single
//! frame at that timeline time instead of the whole video.

mod wave;

use std::io::Write;
use wave::{Cfg, WaveRenderer};

fn rgb(v: &str) -> (u8, u8, u8) {
    let h = v.trim_start_matches('#');
    let p = |s: &str| u8::from_str_radix(s, 16).unwrap();
    (p(&h[0..2]), p(&h[2..4]), p(&h[4..6]))
}

fn parse_args() -> (Cfg, Option<f32>) {
    let mut c = Cfg::default();
    let mut at = None;
    let args: Vec<String> = std::env::args().skip(1).collect();
    let mut i = 0;
    while i < args.len() {
        // Flags without a value.
        match args[i].as_str() {
            "--no-words" => c.words = false,
            "--no-bubbles" => c.bubbles = false,
            "--ship" => c.ship = true,
            _ => {
                let Some(v) = args.get(i + 1) else {
                    panic!("missing value for {}", args[i]);
                };
                match args[i].as_str() {
                    "--width" => c.width = v.parse().unwrap(),
                    "--height" => c.height = v.parse().unwrap(),
                    "--cell-w" => c.cell_w = v.parse().unwrap(),
                    "--cell-h" => c.cell_h = v.parse().unwrap(),
                    "--fps" => c.fps = v.parse().unwrap(),
                    "--loop" => c.loop_secs = v.parse().unwrap(),
                    "--rate" => c.rate = v.parse().unwrap(),
                    "--amp" => c.amp = v.parse().unwrap(),
                    "--chop" => c.chop = v.parse().unwrap(),
                    "--sky" => c.sky = rgb(v),
                    "--sea" => c.sea = rgb(v),
                    "--deep" => c.deep = rgb(v),
                    "--crest" => c.crest = rgb(v),
                    "--foam" => c.foam = rgb(v),
                    "--bubble" => c.bubble = rgb(v),
                    "--ripple-hi" => c.ripple_hi = rgb(v),
                    "--ripple-lo" => c.ripple_lo = rgb(v),
                    "--ship-x" => c.ship_x = v.parse().unwrap(),
                    "--ship-laps" => c.ship_laps = v.parse().unwrap(),
                    "--at" => at = Some(v.parse().unwrap()),
                    other => panic!("unknown arg {other}"),
                }
                i += 1;
            }
        }
        i += 1;
    }
    (c, at)
}

fn main() {
    let (c, at) = parse_args();
    let fps = c.fps;
    let mut r = WaveRenderer::new(c).expect("no usable font found");
    let mut out = std::io::BufWriter::new(std::io::stdout().lock());
    if let Some(t) = at {
        out.write_all(r.render(t)).unwrap();
        return;
    }
    let n_frames = (r.timeline_secs() * fps as f32).round() as usize;
    for fi in 0..n_frames {
        out.write_all(r.render(fi as f32 / fps as f32)).unwrap();
        if fi % fps as usize == 0 {
            eprint!("\rframe {fi}/{n_frames}");
        }
    }
    eprintln!("\rdone: {n_frames} frames      ");
}

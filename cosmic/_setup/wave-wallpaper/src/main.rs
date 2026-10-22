//! Renders the wave wallpaper (intro + one seamless loop) as raw RGBA
//! frames on stdout; pipe into ffmpeg with `-pix_fmt rgba`.

mod wave;

use std::io::Write;
use wave::{Cfg, WaveRenderer};

fn parse_args() -> Cfg {
    let mut c = Cfg::default();
    let args: Vec<String> = std::env::args().skip(1).collect();
    let mut i = 0;
    while i + 1 < args.len() {
        let v = &args[i + 1];
        match args[i].as_str() {
            "--width" => c.width = v.parse().unwrap(),
            "--height" => c.height = v.parse().unwrap(),
            "--cell-w" => c.cell_w = v.parse().unwrap(),
            "--cell-h" => c.cell_h = v.parse().unwrap(),
            "--fps" => c.fps = v.parse().unwrap(),
            "--loop" => c.loop_secs = v.parse().unwrap(),
            "--rate" => c.rate = v.parse().unwrap(),
            "--sky" => {
                let h = v.trim_start_matches('#');
                let p = |s: &str| u8::from_str_radix(s, 16).unwrap();
                c.sky = (p(&h[0..2]), p(&h[2..4]), p(&h[4..6]));
            }
            other => panic!("unknown arg {other}"),
        }
        i += 2;
    }
    c
}

fn main() {
    let c = parse_args();
    let fps = c.fps;
    let mut r = WaveRenderer::new(c).expect("no usable font found");
    let n_frames = (r.timeline_secs() * fps as f32).round() as usize;
    let mut out = std::io::BufWriter::new(std::io::stdout().lock());
    for fi in 0..n_frames {
        out.write_all(r.render(fi as f32 / fps as f32)).unwrap();
        if fi % fps as usize == 0 {
            eprint!("\rframe {fi}/{n_frames}");
        }
    }
    eprintln!("\rdone: {n_frames} frames      ");
}

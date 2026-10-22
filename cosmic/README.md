# cosmic

COSMIC desktop with Gruvbox Dark, JetBrains Mono everywhere, and Fresh's
wave screensaver as an animated wallpaper and lock screen.

## What's here

| Path | What |
|---|---|
| `.config/cosmic/` | All COSMIC settings: `gruvbox-dark.ron` theme, panel/dock, shortcuts, JetBrains Mono for interface, monospace, Terminal and Text Editor, still wallpaper for the lock screen fallback |
| `.config/kitty/` | `kitty.conf` (JetBrainsMono NF) + Gruvbox `theme.conf` |
| `.config/micro/`, `.config/Flame/`, `.config/Code/User/`, `.config/fresh/` | Gruvbox themes for micro, Flame, VS Code, Fresh |
| `.config/systemd/user/fresh-wave-wallpaper.service` | Plays the wave video as the wallpaper on every monitor (mpvpaper) |
| `Pictures/wallpapers/fresh-wave-lock.png` | Still frame of the wave (COSMIC background setting) |
| `_setup/install.sh` | Builds and installs everything that isn't a dotfile (below) |
| `_setup/cosmic-greeter-wave-lock.patch` | Patch for COSMIC's locker: draws the wave live behind the password prompt |
| `_setup/wave-wallpaper/` | Generator for the wallpaper video; `wave.rs` is the same renderer the patch adds |
| `_setup/files.txt` | Which live files belong to this entry (used by `make update-cosmic`) |

GTK colours aren't stored: COSMIC regenerates `gtk-{3,4}.0/gtk.css` from the theme.

## Install on a new machine

```sh
make install-cosmic   # stow the dotfiles into $HOME
make setup-cosmic     # deps, mpvpaper, patched locker, video, service (asks for sudo)
```

Then log out and back in.

## Keep it up to date

```sh
make update-cosmic    # copy the live files listed in _setup/files.txt into the repo
```

On a machine where `~/.config` is already stowed from another entry (e.g.
`fern`), don't `install-cosmic` on top of it; use `update-cosmic` to snapshot.

## The lock screen patch

`install.sh` clones `pop-os/cosmic-greeter`, checks out the tag matching the
installed `cosmic-greeter` package (`epoch-<version>`), applies the patch,
and installs the build to `/usr/local/bin/cosmic-greeter`. cosmic-session
finds it there before `/usr/bin`, so a Fedora update never overwrites it —
but after a COSMIC upgrade, run `make setup-cosmic` again so the locker
matches the new version.

If no font can be loaded, the locker falls back to the still wallpaper. To
go back to the stock lock screen:

```sh
sudo rm /usr/local/bin/cosmic-greeter && pkill -x cosmic-greeter
```

## Wallpaper video

`fresh-wave.webm` is a 44 s intro (tide rising, swell building, Fresh's
exact timeline) followed by a 120 s seamless loop; the service uses mpv's
A-B loop to play the intro once and repeat the rest. Re-render with
different options:

```sh
cd _setup/wave-wallpaper && cargo build --release
target/release/wave-wallpaper --sky '#282828' --rate 1.75 \
  | ffmpeg -f rawvideo -pix_fmt rgba -s 1920x1200 -r 30 -i - \
      -c:v libvpx-vp9 -crf 32 -b:v 0 -row-mt 1 -force_key_frames 44 out.webm
```

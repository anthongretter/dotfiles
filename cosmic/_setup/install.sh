#!/usr/bin/env bash
# Sets up the non-dotfile parts of the `cosmic` entry on Fedora or Arch + COSMIC:
#   1. build deps + JetBrains Mono
#   2. mpvpaper            -> /usr/local/bin/mpvpaper
#   3. patched locker      -> /usr/local/bin/cosmic-greeter (animated lock screen)
#   4. wallpaper video     -> ~/Videos/wallpapers/fresh-wave.webm
#   5. wallpaper service   (systemd --user, starts with the session)
# Run after `make install-cosmic` (or with the dotfiles already in place).
# Every step is skipped if already done; uses sudo where needed.
set -euo pipefail

SETUP="$(cd "$(dirname "$0")" && pwd)"
SRC="${SRC:-$HOME/source}"
mkdir -p "$SRC"

step() { printf '\n==> %s\n' "$*"; }

step "Installing build dependencies and fonts"
if command -v dnf >/dev/null; then
    sudo dnf install -y --skip-unavailable \
        git stow cargo clang-devel pam-devel libinput-devel libxkbcommon-devel \
        meson ninja-build gcc mpv-libs-devel wayland-devel wayland-protocols-devel \
        jetbrains-mono-fonts-all python3
    # Any ffmpeg with libvpx will do (keeps RPM Fusion's ffmpeg if present).
    command -v ffmpeg >/dev/null || sudo dnf install -y ffmpeg-free
    greeter_version() { rpm -q --qf '%{VERSION}' cosmic-greeter; }
elif command -v pacman >/dev/null; then
    # Arch has no -devel split: the library packages carry the headers.
    # rustup users already have cargo; `rust` would conflict with it.
    command -v cargo >/dev/null || sudo pacman -S --needed --noconfirm rust
    sudo pacman -S --needed --noconfirm \
        git stow base-devel clang pam libinput libxkbcommon \
        meson ninja mpv wayland wayland-protocols \
        ttf-jetbrains-mono ffmpeg python
    # "1:1.0.13-1" -> "1.0.13"
    greeter_version() { pacman -Q cosmic-greeter | awk '{print $2}' | sed 's/^[0-9]*://; s/-[^-]*$//'; }
else
    echo "Unsupported distro: need dnf (Fedora) or pacman (Arch)." >&2
    exit 1
fi

step "mpvpaper"
if ! command -v mpvpaper >/dev/null; then
    [ -d "$SRC/mpvpaper" ] || git clone https://github.com/GhostNaN/mpvpaper "$SRC/mpvpaper"
    meson setup "$SRC/mpvpaper/build" "$SRC/mpvpaper" --prefix=/usr/local
    ninja -C "$SRC/mpvpaper/build"
    sudo ninja -C "$SRC/mpvpaper/build" install
else
    echo "already installed: $(command -v mpvpaper)"
    # The wallpaper service runs /usr/local/bin/mpvpaper (e.g. AUR installs to /usr/bin).
    [ -x /usr/local/bin/mpvpaper ] || sudo ln -s "$(command -v mpvpaper)" /usr/local/bin/mpvpaper
fi

step "cosmic-greeter with the animated wave lock screen"
# Patch the release matching the installed COSMIC, so the locker stays in
# sync with the rest of the desktop. /usr/local/bin comes before /usr/bin
# in cosmic-session's PATH, so this copy is the one that runs.
ver="$(greeter_version)"
G="$SRC/cosmic-greeter"
[ -d "$G" ] || git clone https://github.com/pop-os/cosmic-greeter "$G"
git -C "$G" fetch --tags -q
if ! git -C "$G" rev-parse -q --verify "refs/tags/epoch-$ver" >/dev/null; then
    echo "cosmic-greeter $ver has no upstream tag epoch-$ver; can't patch the locker." >&2
    exit 1
fi
if ! git -C "$G" rev-parse -q --verify "fresh-wave-lock-$ver" >/dev/null; then
    git -C "$G" checkout -q -b "fresh-wave-lock-$ver" "epoch-$ver"
    git -C "$G" am -q "$SETUP/cosmic-greeter-wave-lock.patch"
else
    git -C "$G" checkout -q "fresh-wave-lock-$ver"
fi
(cd "$G" && cargo build --release --bin cosmic-greeter)
sudo install -m755 "$G/target/release/cosmic-greeter" /usr/local/bin/cosmic-greeter
echo "Log out and back in (or: pkill -x cosmic-greeter) to start the patched locker."

step "Rendering the wallpaper video"
W="$SETUP/wave-wallpaper"
(cd "$W" && cargo build --release -q)
mkdir -p "$HOME/Videos/wallpapers"
V="$HOME/Videos/wallpapers"
"$W/target/release/wave-wallpaper" \
  | ffmpeg -hide_banner -loglevel error -y -f rawvideo -pix_fmt rgba -s 1920x1200 -r 30 -i - \
      -c:v libvpx-vp9 -crf 32 -b:v 0 -row-mt 1 -deadline good -cpu-used 4 \
      -pix_fmt yuv420p -force_key_frames 44 -f webm "$V/fresh-wave.webm"
ffmpeg -hide_banner -loglevel error -y -ss 44 -i "$V/fresh-wave.webm" -c copy "$V/fresh-wave-loop.webm"

step "Enabling the wallpaper service"
systemctl --user daemon-reload
systemctl --user enable --now fresh-wave-wallpaper.service

echo
echo "Done. COSMIC fonts and theme come from ~/.config/cosmic; log out and back in"
echo "if anything still shows the old look."

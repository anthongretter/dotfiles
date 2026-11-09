#!/usr/bin/env bash
# Switches the look of the `cosmic` entry:  theme.sh <name>   (make theme-cosmic THEME=<name>)
# A theme is a directory in _setup/themes/:
#   - files mirroring $HOME are copied over the live ones;
#   - _theme.sh names the micro/Fresh/Flame themes and the wallpaper;
#   - _vscode.json is merged into VS Code's settings, _flame-theme.json is
#     added to Flame's custom themes.
# `gruvbox` is the entry's default: every file another theme replaces is
# restored from the committed cosmic/ tree.
set -euo pipefail

SETUP="$(cd "$(dirname "$0")" && pwd)"
REPO="$(git -C "$SETUP" rev-parse --show-toplevel)"
name="${1:-}"
T="$SETUP/themes/$name"
if [ -z "$name" ] || [ ! -f "$T/_theme.sh" ]; then
    echo "usage: $0 <theme>   available: $(ls "$SETUP/themes" | tr '\n' ' ')" >&2
    exit 1
fi
# shellcheck source=/dev/null
. "$T/_theme.sh"

step() { printf '==> %s\n' "$*"; }
theme_files() { (cd "$1" && find . -type f ! -name '_*' | sed 's|^\./||'); }

step "Files"
# Everything any theme owns goes back to the default first (or away, if the
# default has no such file), so no theme leaves pieces behind.
for d in "$SETUP"/themes/*/; do theme_files "$d"; done | sort -u | while read -r f; do
    if git -C "$REPO" cat-file -e "HEAD:cosmic/$f" 2>/dev/null; then
        mkdir -p "$(dirname "$HOME/$f")"
        git -C "$REPO" show "HEAD:cosmic/$f" > "$HOME/$f"
    else
        rm -f "$HOME/$f"
    fi
done
theme_files "$T" | while read -r f; do
    mkdir -p "$(dirname "$HOME/$f")"
    cp "$T/$f" "$HOME/$f"
done
# COSMIC stores the wallpaper as an absolute path.
bg="$HOME/.config/cosmic/com.system76.CosmicBackground/v1/all"
[ -f "$bg" ] && sed -i "s|Path(\"/home/[^/]*/|Path(\"$HOME/|" "$bg"

step "Editors (micro, Fresh, VS Code, Flame)"
THEME_DIR="$T" MICRO_COLORSCHEME="$MICRO_COLORSCHEME" FRESH_THEME="$FRESH_THEME" \
FLAME_THEME="$FLAME_THEME" python3 - <<'PY'
import json, os, re
home, env = os.environ["HOME"], os.environ
tdir = env["THEME_DIR"]

def set_key(path, key, value):
    """Replace the first `"key": "..."` in place, keeping the file's formatting."""
    if not os.path.exists(path):
        return print(f"  skip (not found): {path}")
    s = open(path).read()
    s, n = re.subn(r'("%s"\s*:\s*)"[^"]*"' % key, lambda m: m.group(1) + json.dumps(value), s, count=1)
    if n:
        open(path, "w").write(s)
    else:
        print(f"  no \"{key}\" key in {path}; set it to {value!r} by hand")

set_key(f"{home}/.config/micro/settings.json", "colorscheme", env["MICRO_COLORSCHEME"])
set_key(f"{home}/.config/fresh/config.json", "theme", env["FRESH_THEME"])

vs, add = f"{home}/.config/Code/User/settings.json", f"{tdir}/_vscode.json"
if os.path.exists(vs) and os.path.exists(add):
    try:
        cur = json.load(open(vs))
        cur.update(json.load(open(add)))
        open(vs, "w").write(json.dumps(cur, indent=4) + "\n")
    except ValueError:
        print(f"  {vs} has comments; merge {add} by hand")

fl, add = f"{home}/.config/Flame/user-settings.json", f"{tdir}/_flame-theme.json"
if os.path.exists(fl):
    cur = json.load(open(fl))
    def holder(o):
        if isinstance(o, dict):
            if "customThemes" in o:
                return o
            for v in o.values():
                if (r := holder(v)) is not None:
                    return r
    h = holder(cur)
    if h is not None:
        if os.path.exists(add):
            t = json.load(open(add))
            h["customThemes"] = [x for x in h["customThemes"] if x.get("id") != t["id"]] + [t]
        h["theme"] = env["FLAME_THEME"]
        open(fl, "w").write(json.dumps(cur, indent=2) + "\n")
PY

V="$HOME/Videos/wallpapers"
if [ ! -f "$V/$WALLPAPER_VIDEO.webm" ]; then
    step "Rendering the wallpaper video (takes a few minutes)"
    W="$SETUP/wave-wallpaper"
    (cd "$W" && cargo build --release -q)
    mkdir -p "$V"
    # shellcheck disable=SC2086
    "$W/target/release/wave-wallpaper" $WALLPAPER_ARGS \
      | ffmpeg -hide_banner -loglevel error -y -f rawvideo -pix_fmt rgba -s 1920x1200 -r 30 -i - \
          -c:v libvpx-vp9 -crf 32 -b:v 0 -row-mt 1 -deadline good -cpu-used 4 \
          -pix_fmt yuv420p -force_key_frames 44 -f webm "$V/$WALLPAPER_VIDEO.webm"
    ffmpeg -hide_banner -loglevel error -y -ss 44 -i "$V/$WALLPAPER_VIDEO.webm" -c copy "$V/$WALLPAPER_VIDEO-loop.webm"
fi

if [ -z "${THEME_NO_RELOAD:-}" ]; then
    step "Reloading"
    systemctl --user daemon-reload
    systemctl --user try-restart fresh-wave-wallpaper.service || true
    pkill -USR1 -x kitty || true      # kitty re-reads its config on SIGUSR1
fi
echo "Theme: $name. COSMIC apps pick it up live; restart VS Code/Flame/Fresh if they don't."

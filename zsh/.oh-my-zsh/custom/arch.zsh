
# Usage:
# wal-tile "~/Pictures/wallpaper.png"
wal-tile() 
{
  wal -n -i "$@"
  feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}



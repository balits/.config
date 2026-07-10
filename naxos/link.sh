#!/bin/sh

if [ "$EUID" -ne 0 ]; then
  echo "error: this needs sudo"
  exit 1
fi

USER_HOME=$(eval echo "~$SUDO_USER")
NAXOS="$USER_HOME/.config/naxos"
ETC_NIXOS="/etc/nixos"

link() {
  local fname=$1
  local src="$NAXOS/$fname"
  local dst="$ETC_NIXOS/$fname"

  echo "info: linking $fname"
  if [ -f "$src" ]; then
    ln -sf "$src" "$dst"
  else
    echo "warn: source file `$fname` does not exist"
    if [ -L $"dst" ]; then
      echo "info: removing broken link"
      rm "$dest"
    fi
  fi

  echo ""
}

for src_path in "$NAXOS"/*.nix; do
  [ -f "$src_path" ] || continue
  link $(basename "$src_path")
done

echo "info: done"

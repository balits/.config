a symlinked NixOS configuration folder.

(deprecated since switching to flakes)
to link .nix files to /etc/nixos/... run: 
```
chmod +x ./link.sh
sudo ./link.sh
```

since switching to flakes, run this to udpate the system:
```bash
sudo nixos-rebuild switch --flake $HOME/.config/naxos
```

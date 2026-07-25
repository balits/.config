My flake based NixOS configuration

# oopsies:
- `hardware-configuration.nix` points to different devices after each repartition, so a simple `sudo nixos-rebuild switch --flake ...` won't work.
Make sure to copy the freshly generated `/etc/nixos/hardware-configuration.nix` to this folder, or at least change the `fileSytems` part so that each device points to a valid UUID.
- fish is not the default shell for some reason

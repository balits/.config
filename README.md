Configuration files for a bunch of stuff.
Currenlty this assumes NixOS, but most things should work fine on
other operating systems (given the necessary packages / libraries are present).

# Notes
To ensure tmux picks up the its configs, make sure to link it to your $HOME path,
for example with:
```bash
ln -s $HOME/.config/.tmux.conf" "$HOME/.tmux.conf"
```

Configuration files for a bunch of stuff.
Currenlty this assumes NixOS, but most things should work fine on
other operating systems (given the necessary packages / libraries are present).

---

# Notes

To ensure tmux picks up the its configs, make sure to link it to your $HOME path:
```bash
ln -s $HOME/.config/.tmux.conf" "$HOME/.tmux.conf"
```

After a clean NixOS install, you might need  to set
up proton credentials in order for bridge and thunderbird to start working
properly.

```bash
# setup credentials
protonmail-bridge

# ...in thunderbird, configure the email accounts...
# ...also server settings are IMAP(127.0.0.1:1143) SMTP(127.0.0.1:1025)...
```

Then realize you have to pay for protonmail-bridge to work so you give up.

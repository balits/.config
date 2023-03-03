
# z dir jumper
set -gx Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh

# set -g theme_display_user yes
# set -g theme_hide_hostname no
# set -g theme_hostname always

# Aliases
alias ls "lsd"
# alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias hx helix
alias c clear
alias t tree
alias p pnpm
command -qv nvim && alias vim nvim


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/bpm/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

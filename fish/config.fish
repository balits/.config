if status is-interactive
    switch $TERM
        case linux
            :
        case '*'
            if ! set -q TMUX
                exec tmux set-option -g default-shell (which fish) ';' new-session
            end
    end
end

# pretty man pages (which does not work?)
setenv LESS_TERMCAP_mb \e'[01;31m' # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m' # begin bold
setenv LESS_TERMCAP_me \e'[0m' # end mode
setenv LESS_TERMCAP_se \e'[0m' # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m' # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m' # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# aliases
abbr -a cl clear
abbr -a ll 'exa -l'
abbr -a la 'exa -la'
abbr -a t 'tree --gitignore'
abbr -a tg tree
abbr -a c cargo
abbr -a ct "cargo test"
abbr -a g git
abbr -a gs "git status"
abbr -a gl "git log --oneline --graph"

# build in functions

## git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

## actual prompt
function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    # set_color bryellow
    # echo -n "["(whoami)
    # set_color normal
    # echo -n "@"
    # set_color brblue
    # echo -n (hostname)"] "
    if [ $PWD != $HOME ]
        set_color brblue
        echo -n (basename $PWD)
    end
    set_color red
    printf '%s ' (__fish_git_prompt)
    set_color normal
    echo -n '% '
    set_color normal
end

function fish_greeting
    echo "fish says hi!"
end

function fish_on_exit
    echo "fish says goodbye!"
end

# custom functions

function naxos
    set -l naxospath "$HOME/.config/naxos"
    echo "NAXOS: rebuilding OS"
    sudo nixos-rebuild switch --flake $naxospath#naxos
end

function src
    source $HOME/.config/fish/config.fish
    echo "new fish config loaded"
end

# maybe some other day
# function lecho
#     set_color_blue
#     echo -n "l"
# end

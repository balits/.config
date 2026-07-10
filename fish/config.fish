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

# pretty man pages
setenv LESS_TERMCAP_mb \e'[01;31m' # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m' # begin bold
setenv LESS_TERMCAP_me \e'[0m' # end mode
setenv LESS_TERMCAP_se \e'[0m' # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m' # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m' # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# aliases
abbr -a ll 'exa -l'
abbr -a la 'exa -la'
abbr -a t tree
abbr -a c cargo
abbr -a g git
# abbr -a gs git status # git aliases are handles by git/config

# git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

# actual prompt
function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color yellow
    echo -n "["(whoami)
    set_color normal
    echo -n "@"
    set_color blue
    echo -n (hostname)"] "
    if [ $PWD != $HOME ]
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

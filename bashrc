### Bash profile for Diego Mosela

# aliases
alias l='ls -1sh --group-directories-first'
alias la='ls -lah --group-directories-first'
alias ll='ls -lh --group-directories-first'
alias ls='ls -sh --color=auto --group-directories-first'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored terminal
test -n "$DISPLAY" && export TERM=xterm-color

# editor
export EDITOR="vim"

# path
export PATH="~/bin:/usr/local/bin:$PATH"

# nodejs
export NODE_ENV="development"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# colors
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
LightGrey="$(tput setaf 7)"
LightGreyBG="$(tput setab 7)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput setaf 1)"
RedBG="$(tput setab 1)"
LightRed="$(tput bold ; tput setaf 1)"
Green="$(tput setaf 2)"
GreenBG="$(tput setab 2)"
LightGreen="$(tput bold ; tput setaf 2)"
Brown="$(tput setaf 3)"
BrownBG="$(tput setab 3)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
BlueBG="$(tput setab 4)"
LightBlue="$(tput bold ; tput setaf 4)"
Purple="$(tput setaf 5)"
PurpleBG="$(tput setab 5)"
Pink="$(tput bold ; tput setaf 5)"
Cyan="$(tput setaf 6)"
CyanBG="$(tput setab 6)"
LightCyan="$(tput bold ; tput setaf 6)"
NC="$(tput sgr0)"

# git status
function git_prompt {
    STATUS=`git status 2>&1`

    if [[ "$STATUS" == *'Not a git repository'* ]]
    then
        echo ''
    else
        if [[ "$STATUS" == *'working directory clean'* ]]
        then
            echo -e '-clean'
        else
            echo -e '-dirty'
        fi
    fi
}

# git branch
function git_info {
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    gitInfo=""

    if [[ -n $ref ]]
    then
        echo -e "git:($Red${ref#refs/heads/}$Blue)"
    fi
}

# powerline-bash
function make_ps1() {
    $PROMPT_COMMAND_EXTRAS
    export PS1='\[$Blue\]\u\[$Red\] → \[$LightCyan\]\w/ \[$Blue\]\[$(git_info)\]\[$Brown\]\[$(git_prompt)\] '
    export PS1=$PS1'\n\[$Yellow\]$\[$NC\] '
}

export PROMPT_COMMAND=make_ps1
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lha'
alias tree='tree -C'

dmake_func() {
    local path=$(realpath .)
    local project=$(basename $path)
    docker run -it --rm -v $path:/usr/src/$project -w /usr/src/$project cpp-dev:latest make $@
}
alias dmake=dmake_func

PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


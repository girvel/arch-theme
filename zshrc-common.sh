#!/usr/bin/env zsh

# CROSS-PLATFORM SHIT #
if [ -n "$WSL_DISTRO_NAME" ]; then
    alias g="git.exe"
    alias c='cargo.exe'
else
    alias g="git"
    alias c="cargo"
fi

# BASE #
cdw () {
    cd $WORKSHOP/$1
}

alias A='sudo aptitude'
alias a='aptitude'
alias e='$EDITOR'
alias E='sudo $EDITOR'
alias l='eza -lAh --group-directories-first'
function lm() {
    eza -lAr -s=modified --color=always "$@" | head -n 20
}
alias love='love.exe .'
alias z="zig.exe"

# EDITOR #
git config --global core.editor "$EDITOR"
alias erc='e ~/.zshrc; source ~/.zshrc'
alias rc='source ~/.zshrc'
function ebin() {
    e ~/.local/bin/"$1"
    chmod +x ~/.local/bin/"$1"
}

# GIT #
alias ga='g add `g rev-parse --show-toplevel`'
alias gac='ga && git commit'
alias gacp='gac && g push'
alias gsync='gac -m "#" && g push'
function gacpm() {
    ga && git commit -m "$1" && g push
}

alias gst='g status'
alias gd='g diff'
alias glog='g log --oneline --graph'

# GITHUB #
alias td='gh issue create --body "" --title'
alias tdl="gh issue list"
alias tdd="gh issue close"

# DOCKER #
alias d='docker'
alias dc='docker compose'

# LOOPER #
alias lp='looper'
function lps() {
    old_path=$(pwd)
    cd; cd dotfiles_private
    gsync
    cd $old_path
}
alias lpe='e $(looper path schedule); lps'

# C #
alias cbuild="cd build && cmake .. && make && cd .."

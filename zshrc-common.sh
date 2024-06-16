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
alias cdw='cd $WORKSHOP'

alias A='sudo aptitude'
alias a='aptitude'
alias e='$EDITOR'
alias E='sudo $EDITOR'
alias l='ls -lAh --group-directories-first'
alias td='todoist'

# EDITOR #
git config --global core.editor "$EDITOR"
alias erc='e ~/.zshrc; source ~/.zshrc'
alias rc='source ~/.zshrc'
function ebin() {
    e ~/.local/bin/"$1"
    chmod +x ~/.local/bin/"$1"
}

# GIT #
alias gac='g add `g rev-parse --show-toplevel` && git commit'
alias gacp='gac && g push'
alias gsync='gac -m "#" && g push'

alias gst='g status'
alias gd='g diff'
alias glog='g log --oneline --graph'

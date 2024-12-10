#!/usr/bin/env zsh

setopt prompt_subst
chpwd() {
  if [[ `g rev-parse --is-inside-work-tree 2>/dev/null` == "true" ]]
  then
    relpath=`realpath --relative-to="$(git rev-parse --show-toplevel)/.." .`
    branch=`g rev-parse --abbrev-ref HEAD 2>/dev/null`
    relpath="%B%F{blue}$relpath%F{yellow}[$branch]%f%b"
  else
    relpath="%~"
  fi

  if ! g diff-index --quiet HEAD --
  then
    git_status="%B%F{blue}+%f%b"
  else
    git_status=""
  fi

  export PROMPT="
%B%F{red}%n%b%F{white}@%m ${relpath}${git_status} %# "
}

chpwd

autoload -U add-zsh-hook
add-zsh-hook precmd chpwd


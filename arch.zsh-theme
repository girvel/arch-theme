#!/usr/bin/env zsh

setopt prompt_subst
chpwd() {
  if [[ `git rev-parse --is-inside-work-tree 2>/dev/null` == "true" ]]
  then
    relpath=`realpath --relative-to="$(git rev-parse --show-toplevel)/.." .`
    relpath="%B%F{blue}$relpath%b%f"
  else
    relpath=$PWD
  fi

  export PROMPT="
%B%F{red}%n%b%F{white}@%m ${relpath} %# "
}

chpwd


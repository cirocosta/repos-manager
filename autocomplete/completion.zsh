#!/bin/zsh

_repos-manager () {
  local word completions

  word="$1"
  completions=$(repos-manager compl "${word}")
  reply=( "${(ps:\n:)completions}" )
}

compctl -K _repos-manager repos-manager


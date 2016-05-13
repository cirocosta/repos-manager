#!/bin/bash

_repos-manager () {
  local input completions

  COMPREPLY=()
  input="${COMP_WORDS[COMP_CWORD]}"
  completions=$(repos-manager compl "$input")

  COMPREPLY=( $(compgen -W "$completions" -- "$input") )
}

complete -F _repos-manager repos-manager


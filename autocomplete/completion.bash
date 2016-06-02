#!/bin/bash

_repos-manager () {
  local input completions

  COMPREPLY=()
  input="${COMP_WORDS[COMP_CWORD]}"
  IFS=$'\n'
  completions=$(repos-manager compl "$input")

  COMPREPLY=( $(compgen -W "$completions" -- "$input") )
	if [[ ${#COMPREPLY[*]} -eq 1 ]]; then
    COMPREPLY=( ${COMPREPLY[0]%%:*} )
  fi
}

complete -F _repos-manager repos-manager


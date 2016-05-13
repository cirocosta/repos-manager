#!/bin/bash

_repos-manager () {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"
  local completitions=$(repos-manager compl $word)

  COMPREPLY=( $(compgen -W "$completitions" -- "$word"  )
}

complete -F _repos-manager repos-manager


#!/bin/sh

if test "$BASH_VERSION"; then
  root="$(dirname "${BASH_SOURCE[0]}")"
  source "$root/completion.bash"

elif test "$ZSH_VERSION"; then
  root="$(dirname "$0")"
  source "$root/completion.zsh"
fi

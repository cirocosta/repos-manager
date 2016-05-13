#!/bin/zsh

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

local dir=$(dirname $0)
. ${dir}/completion.bash

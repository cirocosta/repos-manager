#!/bin/bash

# Installs repos-manager by creating a soft link
# of `repos-manager` in `/usr/local/bin`, making
# then `repos-manager` accessible from anywhere.

set -e

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

readonly BIN_SRC_NAME=$(realpath "${DIR}/repos-manager")
readonly BIN_LINK_NAME="/usr/local/bin/repos-manager"

main () {
  create_link
  show_autocomplete_help
}

create_link () {
  echo "Creating link '${BIN_LINK_NAME}'"

	if [[ -L ${BIN_LINK_NAME} ]]; then
		rm ${BIN_LINK_NAME}
	fi

	ln -s ${BIN_SRC_NAME} ${BIN_LINK_NAME}

	echo "Link created!"
}

show_autocomplete_help ()  {
	cat<<-EOF

In order to get autocomplete working, edit your shell's 
run commands files as follows:

  bashrc:
    source \$(repos-manager complpath)/completition.bash

  zshrc:
    fpath=(\$(repos-manager complpath) \$fpath) && compinit

After that, source your shell's rc (or restart the shell) and
you're ready to go!
EOF
}

main

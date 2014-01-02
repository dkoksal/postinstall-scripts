#!/bin/bash
# Post installation script
# This incorporates code directly from Crunchbang's cb-welcome script
# but includes pieces which are not expected to be useful in that context.
# Pieces of the code which could be considered useful to cb-welcome will be
# added to a fork later. This is intended to work on any apt-based distribution.

createFlag() {
    mkdir -p "/home/$USER/.config/dpis"
    touch "/home/$USER/.config/dpis/dpis-welcome"
}

runInTerminal() {
    x-terminal-emulator -e 'dpis'
    exit 0
}

# First run
if [[ $1 = '--firstrun' ]]; then
if [[ -d /live/overlay || -e /home/$USER/.config/dpis/dpis-welcome || ! $(groups) =~ ( |^)sudo( |$) ]]; then
exit 1
    fi
runInTerminal
fi

# Open in terminal
if [[ $1 = '--open' ]]; then
runInTerminal
fi

createFlag

if ! [[ $(groups) =~ ( |^)sudo( |$) ]]; then
echo 'Error: must be a member of the sudo group to run this script.' # TODO 'root' user is not a member of the sudo group. Is it meant to restrict root from executing this script?
  exit 1
fi

LIBDIR='scripts'
if [[ -f scripts/lib/prompt.sh ]]; then # TODO remove cb-include.cfg. Currently it has only one poorly written function to check internet connection.
    source 'scripts/lib/prompt.sh'
else
echo 'Error: Failed to locate prompt.sh'
    exit 1
fi

# Import prompt
if [[ -f ${LIBDIR}/lib/prompt ]]; then
        source "${LIBDIR}/lib/prompt"
else
        echo 'Error: Failed to locate prompt'
        exit 1
fi

exit 0

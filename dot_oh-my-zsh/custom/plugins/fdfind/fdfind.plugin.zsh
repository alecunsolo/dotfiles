(( ${+commands[fdfind]} )) || continue

if alias fd > /dev/null 2>&1 ; then
    unalias fd
fi

function fd() {
    fdfind "$@"
}

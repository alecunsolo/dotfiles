# External ip
function ext-ip() {
    if (( ${+commands[dig]} )); then
        dig +short myip.opendns.com @resolver1.opendns.com
        return $?
    elif (( ${+commands[drill]} )); then
        drill -Q myip.opendns.com @resolver1.opendns.com
        return $?
    else
        die "dig not installed"
    fi
}

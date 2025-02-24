# Keep the PC awake
awake() {
    local min=${1:-15}
    echo "Keep the mac awake for $min minutes"
    caffeinate -diut $((60 * min))
}


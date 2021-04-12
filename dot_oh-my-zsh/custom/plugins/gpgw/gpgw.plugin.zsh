#!/bin/zsh

# Help function
gpgw__help() {
    # FIXME
    echo "Help"
}

# Encryption
gpgw__encrypt() {
    setopt localoptions pipefail
    local self src
    local -a o_recp
    local -A opts
    # Self-encryption. -r flag will overwrite this parameter
    zstyle -s ':omz:plugins:gpgw' self self
    if [[ -n $self ]]; then
        o_recp=( -r $self )
    fi
    # Parse options
    zparseopts -D -E -F -K -A opts -M -- \
        S -no-sign=S \
        a -armor=a \
        o: -out:=o  \
        r+:=o_recp -recipient+:=r
    (( $? )) && {
        echo "Failed to parse options" 1>&2
        return 1
    }
    # Armor
    if (( ${+opts[-a]} )); then
        armor='--armor'
        armorSuffix='.asc'
    fi

    # Sign
    if (( ! ${+opts[-S]} )); then
        sign='--sign'
    fi
    src=$1

    # Check parameter
    if [[ -z $src ]]; then
        echo "Must pass a source file/directory to encrypt" 1>&2
        return 1
    fi

    if [[ -f $src ]]; then
        # Encrypt regular file
        # Output
        if (( ${+opts[-o]} )); then
            out=${opts[-o]}
        else
            out="${src}.gpg${armorSuffix}"
        fi

        gpg $o_recp $sign $armor --output $out --encrypt $src
        return $?
    fi
    if [[ -d $src ]]; then
        # Encrypt a directory
        # Output
        if (( ${+opts[-o]} )); then
            out=${opts[-o]}
        else
            out="${src}.tar.gpg${armorSuffix}"
        fi

        tar -c $src | gpg $o_recp $sign $armor --output $out --encrypt
        return $?
    fi
    echo "$src is not a file or a directory"
    return 1
}

# Decryption
gpgw__decrypt() {
    local src=$1
    local -A opts

    # Parse options
    zparseopts -D -E -F -K -A opts -M -- \
        o: -out:=o

    # Check parameter
    if [[ -z $src ]]; then
        echo "Must pass a file to decrypt" 1>&2
        return 1
    fi

    if (( ${+opts[-o]} )); then
        out=${opts[-o]}
    else
        out="-"
    fi

    gpg --decrypt --output $out $src
    return $?
}

# Detach sign files
gpgw__sign() {
    local src=$1
    # Check parameter
    if [[ -z $src ]]; then
        echo "Must pass a file to sign" 1>&2
        return 1
    fi

    gpg --output $src.sig --detach-sig $src
    return $?
}

# Verify signature (detached)
gpgw__verify() {
    local src=$1
    # Check parameter
    if [[ -z $src ]]; then
        echo "Must pass a file to verify" 1>&2
        return 1
    fi

    if [[ ! -f $src ]]; then
        echo "Unable to find file to verify [$src]"
        return 1
    fi

    if [[ ! -f $src.sig ]]; then
        echo "Unable to find signature file [$src.sig]"
        return 1
    fi
    gpg --verify $src.sig $src
}

gpgw__restart-agent() {
     gpg-connect-agent reloadagent /bye
}

# Main command
gpgw() {
    emulate -LR zsh
    # set -x
    local cmdname=$1
    if [[ -z "$1" ]]; then
        echo "Must pass a valid subcommand"
        gpgw__help
        return 1
    fi
    shift
    if type "gpgw__$cmdname" > /dev/null 2>&1; then
        "gpgw__$cmdname" "$@"
    else
        echo "Subcommand $cmdname not recognized"
        return 1
    fi
}

#!/usr/bin/env bash

if command -v 1password > /dev/null ; then
    if pgrep -u $USER 1password > /dev/null; then
        1password --lock > /dev/null 2>&1;
    fi
fi

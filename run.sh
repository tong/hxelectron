#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    ./atom/Atom.app/Contents/MacOS/Atom bin
else
    echo "Not implemented"
    exit 1
fi

exit 0

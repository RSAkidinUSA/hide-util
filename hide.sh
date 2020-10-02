#!/bin/bash

for entry in "$@"; do
    src=$(echo $entry | rev | cut -d/ -f1 | rev)
    if [[ $src == $entry ]]; then
        path="./"
    else 
        path=$(echo $entry | rev | cut -d/ -f2- | rev)
    fi
    dst=".""$src"
    if test -f "$path"/"$dst"; then
        echo "File already exists, can't hide."
    else
        mv "$path"/"$src" "$path"/"$dst"
    fi
done

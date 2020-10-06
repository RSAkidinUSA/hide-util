#!/bin/bash

for entry in "$@"; do
    src=$(echo $entry | rev | cut -d/ -f1 | rev)
    if [[ $src == $entry ]]; then
        path="./"
    else 
        path=$(echo $entry | rev | cut -d/ -f2- | rev)
    fi
    dst=".""$src"
    if [ "${src:0:1}" == "." ]; then
        :
    elif test -f "$path"/"$dst"; then
        echo "$path/$dst already exists, can't hide."
    else
        mv "$path"/"$src" "$path"/"$dst"
    fi
done

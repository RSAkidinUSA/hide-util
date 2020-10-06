#!/bin/bash

for entry in "$@"; do
    if test -e $entry; then
        if [[ $entry == *"/"* ]]; then
            src=$(echo $entry | rev | cut -d/ -f1 | rev)
            path=$(echo $entry | rev | cut -d/ -f2- | rev)
        else
            src=$entry
            path="."
        fi
        dst=$(echo $src | cut -d. -f2-)
        if [ "${src:0:1}" != "." ]; then
            :
        elif test -f "$path"/"$dst"; then
            echo "$path/$dst already exists, can't unhide."
        else
            mv "$path"/"$src" "$path"/"$dst"
        fi
    else
        echo "$entry does not exist"
    fi
done

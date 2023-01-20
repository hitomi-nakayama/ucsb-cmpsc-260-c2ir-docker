#!/bin/bash

# group files by directory so we can process them in one docker run
declare -A directories
for f in "$@" ; do
    filename=$(basename "$f")
    if [[ ! -v directories[@] ]] ; then
        directory=$(dirname $(realpath "$f"))
        directories["$directory"]="${filename}"
    else
        files="${directories["$directory"]}"$'\n'"${filename}"
        directories["$directory"]="${files}"
    fi
done

for directory in "${!directories[@]}" ; do
    readarray -t files <<< "${directories[$directory]}"

    docker run --rm -u $(id -u):$(id -g) -v "${directory}:/target" -w /target c2ir "${files[@]}"
done

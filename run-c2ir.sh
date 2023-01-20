#!/bin/bash
set -e -x

for f in "$@"; do
    directory=$(dirname $(realpath "$f"))
    filename=$(basename "$f")
    docker run --rm -u $(id -u):$(id -g) -v "${directory}:/target" -w /target c2ir "${filename}"
done

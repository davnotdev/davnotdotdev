#!/bin/sh
# Usage: ./toavif.sh <input> <height> [quality]
set -eu

[ $# -ge 2 ] || { echo "usage: $0 <input> <height> [quality]" >&2; exit 1; }

in=$1
height=$2
quality=${3:-60}
dir=$(dirname "$0")/opt
name=$(basename "${in%.*}")

mkdir -p "$dir"
magick "$in" -resize "x$height" -quality "$quality" "$dir/$name.avif"
echo "$dir/$name.avif"

#!/bin/bash
# Simple script to generate multiple, rendered versions of a high-quality image

src="$1"
versions="${2:-128 256 512 1024}"

dir=$(dirname "$1")
base=$(basename "$1" | sed "s/_hq//")
base=${base%.*}

for ver in ${versions[*]} ; do
    echo "Resizing $src with $ver"
    convert -resize "${ver}x${ver}" "$src" "$dir/${base}_${ver}.png"
done

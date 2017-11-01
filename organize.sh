#!/bin/bash

case "$1" in
	organize)
		## handles *.??? ( three letter extensioned files only )
		#for file in *.??? ; do
		#    [ -f "$file" ] || continue
		#    dir="$(echo "$file" | rev | cut -c-3 | rev)"
		#    mkdir -p "$dir" || { echo "Couldn't mkdir -p $dir; exiting" ; exit 1 ; }
		#    mv -- "$file" "$dir"
		#done

		# handles all files
		for file in *.*[!.]
		do
		    ext=${file##*.}
		    mkdir -p -- "$ext"  &&  mv -- "$file" "$ext"/
		done
        ;;
	flatten)
		find . -mindepth 2 -type f -exec mv "{}" . \; && find . -type d -empty -delete
        ;;
	*)
        echo "Usage: $0 {organize|flatten}"
        exit 1
esac

exit 0


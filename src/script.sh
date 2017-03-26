#!/bin/bash

. library.sh

cmd=$(defaults read com.apple.finder AppleShowAllFiles)

arg=$1

if [[ -z $arg ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "status" "Hidden Files are showing." "Hidden Files are showing." "images/status.png" "yes" "status"
		addResult "" "hide" "Hide Hidden Files." "Hide Hidden Files." "images/hide.png" "yes" "hide"
	else
		addResult "" "status" "Hidden Files are hidden." "Hidden Files are hidden." "images/status.png" "yes" "status"
        addResult "" "show" "Show Hidden Files." "Show Hidden Files." "images/show.png" "yes" "show"
	fi
elif [[ $arg =~ ^(s|S)([hH]*) ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "invalid" "invalid" "Hidden files are already shown now!" "images/invalid.png" "yes" "invalid"
	else
		addResult "" "show" "show" "Show Hidden Files." "images/show.png" "yes" "show"
	fi
elif [[ $arg =~ ^(h|H)([iI]*) ]]; then
	if [ $cmd == 1 ]; then
		addResult "" "hide" "hide" "Hide Hidden Files." "images/hide.png" "yes" "hide"
	else
		addResult "" "invalid" "invalid" "Hidden files are already hidden now!" "images/invalid.png" "yes" "invalid"
	fi
fi
getXMLResults
exit

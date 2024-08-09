#!/bin/zsh
wlopm
selection="$(echo "$(wlopm)" | fuzzel --dmenu -l $(wlopm | wc -l) 2>/dev/null)"
wlopm --toggle $selection[(ws: :)1]


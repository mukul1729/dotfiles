#!/bin/zsh
cliphist list | fuzzel --dmenu | cliphist decode | wl-copy

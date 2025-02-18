#!/bin/sh

color=$(hyprpicker -a)

if [[ color == "" ]]; then
	notify-send -a "hyprpicker" "Canceled"
	exit 0
fi

notify-send -a "hyprpicker" "Get color: $color" -i "$HOME/.icons/Papirus/48x48/apps/colors.svg"

#!/bin/sh

color=$(hyprpicker -a)

if [[ color == "" ]]; then
    notify-send -a "hyprpicker" "Canceled"
    exit 0
fi

notify-send -a "hyprpicker" "Get color: $color" -i /home/gilang/.local/share/icons/Papirus/16x16/apps/colors.svg

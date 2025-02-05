#!/usr/bin/env bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=/run/user/1000/bus

WARNING_LEVEL=20
BATTERY_DISCHARGING=$(acpi -b | grep -c "Discharging")
BATTERY_LEVEL_BAT0=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')
BATTERY_LEVEL_BAT1=$(acpi -b | grep "Battery 1" | grep -P -o '[0-9]+(?=%)')

EMPTY_FILE=/tmp/batteryempty
FULL_FILE=/tmp/batteryfull

if [[ "$BATTERY_DISCHARGING" -eq 1 && -f $FULL_FILE ]]; then
	rm $FULL_FILE
elif [[ "$BATTERY_DISCHARGING" -eq 0 && -f $EMPTY_FILE ]]; then
	rm $EMPTY_FILE
fi

if [[ "$BATTERY_LEVEL_BAT0" -gt 80 && "$BATTERY_LEVEL_BAT1" -gt 80 && "$BATTERY_DISCHARGING" -eq 0 && ! -f $FULL_FILE ]]; then
	notify-send -a "battery notify" 'Battery Charged' "Battery is fully charged." -i $HOME/.nix-profile/share/icons/Papirus/48x48/status/battery-full-charged.svg
	touch $FULL_FILE
elif [[ "$BATTERY_LEVEL_BAT0" -le "$WARNING_LEVEL" && "$BATTERY_LEVEL_BAT1" -le "$WARNING_LEVEL" && "$BATTERY_DISCHARGING" -eq 1 && ! -f $EMPTY_FILE ]]; then
	notify-send -a "battery notify" 'Low Battery' "${BATTERY_LEVEL}% of battery remaining." -i $HOME/.nix-profile/share/icons/Papirus/48x48/status/battery-low.svg
	touch $EMPTY_FILE
fi

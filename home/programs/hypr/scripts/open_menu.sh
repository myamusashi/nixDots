#!/bin/sh

handle() {
	case $1 in
	monitoradded*)
		$HOME/.config/hypr/scripts/ags_connect &
		disown
		ags run -d $HOME/Documents/Project/ags/ &
		disown
		;;
	openlayer*)
		handle_openlayer "$1" "$2"
		;;
	focusedmon*)
		parse_focusedmon "$1"
		;;
	esac
}

handle_openlayer() {
	local menu_name=$(echo "$1" | awk -F'>>' '{print $2}')
    echo "$2"
	local x_eDP y_eDP x_HDMI y_HDMI

	case $menu_name in
	notificationsmenu)
		x_eDP=1136
		y_eDP=455
		x_HDMI=1666
		y_HDMI=1181
		;;
	dashboardmenu)
		x_eDP=211
		y_eDP=432
		x_HDMI=204
		y_HDMI=1160
		;;
	calendarmenu)
		x_eDP=1200
		y_eDP=403
		x_HDMI=1746
		y_HDMI=1165
		;;
	audiomenu)
		x_eDP=840
		y_eDP=229
		x_HDMI=1319
		y_HDMI=980
		;;
	networkmenu)
		x_eDP=890
		y_eDP=213
		x_HDMI=1383
		y_HDMI=992
		;;
	bluetoothmenu)
		x_eDP=958
		y_eDP=202
		x_HDMI=1444
		y_HDMI=1016
		;;
	energymenu)
		x_eDP=1018
		y_eDP=154
		x_HDMI=1566
		y_HDMI=930
		;;
	*)
		echo "Unknown menu: $menu_name"
		return
		;;
	esac

	if [ "$focused_monitor" = "eDP-1" ] && [ "$2" = "yes" ]; then
		hyprctl dispatch movecursor $x_eDP $y_eDP
	elif [ "$focused_monitor" = "HDMI-A-1" ]; then
		hyprctl dispatch movecursor $x_HDMI $y_HDMI
	fi
}

parse_focusedmon() {
	local monitor_info=$(echo "$1" | awk -F'>>' '{print $2}')
	focused_monitor=$(echo "$monitor_info" | cut -d',' -f1)
	workspace=$(echo "$monitor_info" | cut -d',' -f2)
	echo "Focused monitor: $focused_monitor, Workspace: $workspace"
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line lain; do
	handle "$line"
done

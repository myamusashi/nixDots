#!/bin/sh

case "$1" in
    "--notificationsmenu")
        echo "openlayer>>notificationsmenu" "yes" > /proc/19423/fd/0
        astal -i hyprpanel -t notificationsmenu
        ;;
    "--calendarmenu")
        command ...
        ;;
    "--dashboardmenu")
        ;;
esac

#!/usr/bin/env bash

# Script configuration
readonly LOG_FILE="/tmp/wallpaper_backup.log"
readonly CACHE_DIR="$HOME/.cache/wall"

# Color definitions for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly NC='\033[0m' # No Color

if [[ ! -d "$CACHE_DIR" ]]; then
	mkdir -p "$CACHE_DIR"
fi

# Logging function
log() {
	local level=$1
	shift
	local message="[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $*"
	echo -e "$message" | tee -a "$LOG_FILE"
}

# Error handling function
error() {
	log "ERROR" "${RED}$*${NC}"
	# notify "ERROR" "$*"
	return 1
}

# Backup wallpapers
backup_wallpapers() {
	local current_time=$(date '+%Y-%m-%d %H:%M:%S')

	# Check for HDMI wallpaper
	local hdmi_wall=$(swww query | grep HDMI | awk '{print $8}')
	if [[ -n "$hdmi_wall" && -f "$hdmi_wall" ]]; then
		if cp -f "$hdmi_wall" "$CACHE_DIR/HDMI.png"; then
			log "SUCCESS" "${GREEN}HDMI wallpaper backed up successfully${NC}"
			# notify "SUCCESS" "HDMI wallpaper backed up at $current_time"
		else
			error "Failed to backup HDMI wallpaper"
		fi
	fi

	# Check for eDP wallpaper
	local edp_wall=$(swww query | grep eDP | awk '{print $8}')
	if [[ -n "$edp_wall" && -f "$edp_wall" ]]; then
		if cp -f "$edp_wall" "$CACHE_DIR/eDP.png"; then
			log "SUCCESS" "${GREEN}eDP wallpaper backed up successfully${NC}"
			# notify "SUCCESS" "eDP wallpaper backed up at $current_time"
		else
			error "Failed to backup eDP wallpaper"
		fi
	fi
}

get_live_wallpapers() {
	local current_time=$(date '+%Y-%m-%d %H:%M:%S')

	if grim -c -o HDMI-A-2 $HOME/.cache/wall/Watch_HDMI.png >/dev/null 2>&1; then
		log "SUCCESS" "${GREEN}HDMI wallpaper backed up successfully${NC}"
	else
		error "Failed to backup HDMI wallpaper"
	fi

	if grim -c -o eDP-1 $HOME/.cache/wall/Watch_eDP.png >/dev/null 2>&1; then
		log "SUCCESS" "${GREEN}eDP wallpaper backed up successfully${NC}"
	else
		error "Failed to backup eDP wallpaper"
	fi
}

main() {
	backup_wallpapers
	get_live_wallpapers
}

main

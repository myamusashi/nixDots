#!/usr/bin/env bash

readonly LOG_FILE="/tmp/wallpaper_backup.log"
readonly CACHE_DIR="$HOME/.cache/wall"

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly NC='\033[0m' # No Color

check_output_active() {
	local output=$1
	hyprctl monitors -j | jq -e --arg output "$output" '.[] | select(.name == $output)' >/dev/null 2>&1
}

log() {
	local level=$1
	shift
	local message="[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $*"
	echo -e "$message" | tee -a "$LOG_FILE"
}

error() {
	log "ERROR" "${RED}$*${NC}"
	return 1
}

backup_wallpapers() {
	if [[ -n $(check_output_active "HDMI-A-2") ]]; then
		if cp -uf "HDMI-A-2" "$CACHE_DIR/HDMI.png"; then
			log "SUCCESS" "${GREEN}HDMI wallpaper backed up (optimized)${NC}"
		else
			error "Failed to backup HDMI wallpaper"
		fi
	fi

	if [[ -n $(check_output_active "eDP-1") ]]; then
		if cp -uf "eDP-1" "$CACHE_DIR/eDP.png"; then
			log "SUCCESS" "${GREEN}eDP wallpaper backed up (optimized)${NC}"
		else
			error "Failed to backup eDP wallpaper"
		fi
	fi
}

get_current_wallpapers() {
	if check_output_active "HDMI-A-2"; then
		if grim -l 1 -o HDMI-A-2 "$HOME/.cache/wall/Watch_HDMI.png" >/dev/null 2>&1; then
			log "SUCCESS" "${GREEN}HDMI screenshot optimized${NC}"
		else
			error "Failed to capture HDMI current wallpaper"
		fi
	fi

	if check_output_active "eDP-1"; then
		if grim -l 1 -o eDP-1 "$HOME/.cache/wall/Watch_eDP.png" >/dev/null 2>&1; then
			log "SUCCESS" "${GREEN}eDP screenshot optimized${NC}"
		else
			error "Failed to capture eDP current wallpaper"
		fi
	fi
}

main() {
	[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"
	backup_wallpapers
	# get_current_wallpapers
}

main

#!/usr/bin/env bash

check_compiler() {
	local compiler_processes=("gcc" "g++" "clang" "clang++" "rustc" "cargo" "cc" "cc1" "c++")
	for proc in "${compiler_processes[@]}"; do
		if pgrep -x "$proc" >/dev/null; then
			return 0 # Ditemukan
		fi
	done
	return 1 # Tidak ditemukan
}

check_home_manager_or_nixos_rebuild() {
	if pgrep -f "home-manager" >/dev/null || pgrep -f "nixos-rebuild" >/dev/null; then
		return 0 # Ditemukan
	fi
	return 1 # Tidak ditemukan
}

main() {
	if check_compiler || check_home_manager_or_nixos_rebuild; then
		powerprofilesctl set performance
		loginctl lock-session
	else
		powerprofilesctl set power-saver
		loginctl lock-session
	fi
}

main

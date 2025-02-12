#!/usr/bin/env bash

# Fungsi untuk memeriksa apakah ada compiler yang sedang berjalan
check_compiler() {
	local compiler_processes=("gcc" "g++" "clang" "clang++" "rustc" "cargo" "cc" "cc1" "c++")
	for proc in "${compiler_processes[@]}"; do
		if pgrep -x "$proc" >/dev/null; then
			return 0 # Ditemukan
		fi
	done
	return 1 # Tidak ditemukan
}

# Fungsi untuk memeriksa apakah ada home-manager atau nixos-rebuild yang sedang berjalan
check_home_manager_or_nixos_rebuild() {
	if pgrep -f "home-manager" >/dev/null || pgrep -f "nixos-rebuild" >/dev/null; then
		return 0 # Ditemukan
	fi
	return 1 # Tidak ditemukan
}

# Fungsi utama untuk menjalankan semua pemeriksaan
main() {
	if check_compiler || check_home_manager_or_nixos_rebuild; then
		powerprofilesctl set power-saver
	else
		powerprofilesctl set performance
	fi
}

main

#!/usr/bin/env bash

## Buat direktori
if [[ ! -d "$HOME/.icons" ]]; then
    mkdir -p "$HOME/.icons"
fi

if [[ ! -d "$HOME/.themes" ]]; then
    mkdir -p "$HOME/.themes"
fi

if [[ ! -d "$HOME/.local/share/icons" ]]; then
    mkdir -p "$HOME/.local/share/icons"
fi

if [[ ! -d "$HOME/.local/share/themes" ]]; then
    mkdir -p "$HOME/.local/share/themes"
fi

if [[ ! -d "$HOME/.config/nix" ]]; then
    mkdir -p "$HOME/.config/nix"
fi

echo "access-tokens = github.com=ghp_AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" > "$HOME/.config/nix/nix.conf"

## Copy hardware-configuration 
cp -f "/etc/nixos/hardware-configuration.nix" "$HOME/.dots/system/config/modules"

## Install cachix
nix-env -iA cachix -f https://cachix.org/api/v1/Install
cachix use nix-community

## flake update
nix flake update

## Install nixos unstable and home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
sudo nixos-rebuild switch --flake "$HOME/.dots" --keep-going --upgrade

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager switch --flake "$HOME/.dots" --keep-going

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

if [[ ! -d "/run/media/Ventoy" ]]; then
    sudo mkdir -p "/run/media/Ventoy"
	sudo chown gilang:gilang "/run/media/Ventoy"
fi

if [[ ! -d "/run/media/apalah" ]]; then
    sudo mkdir -p "/run/media/apalah"
	sudo chown gilang:gilang "/run/media/apalah"
fi

if [[ ! -d "/run/media/extn" ]]; then
    sudo mkdir -p "/run/media/extn"
	sudo chown gilang:gilang "/run/media/extn"
fi

## rebuild for now because we had this mf issue
sudo grep -q 'nix.settings' /etc/nixos/configuration.nix || \
sudo sed -i '$ i\
nix.settings = {\
    trusted-users = [ "root" "myamusashi" ];\
    experimental-features = [ "nix-command" "flakes" ];\
};' /etc/nixos/configuration.nix

sudo nixos-rebuild switch

## Copy hardware-configuration 
cp -f "/etc/nixos/hardware-configuration.nix" "$HOME/.dots/system/config/modules"

## Install cachix
nix-env -iA cachix -f "https://cachix.org/api/v1/install"
cachix use nix-community

## flake update
nix --extra-experimental-features "nix-command flakes" flake update

## Install nixos unstable and home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
sudo nixos-rebuild switch --flake "$HOME/.dots" --keep-going --upgrade

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager switch --flake "$HOME/.dots" --keep-going


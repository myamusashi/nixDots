{pkgs, ...}: {
  imports = [./starship.nix];
  programs.fish = {
    enable = true;

    shellInit = ''
      #Shortcut
      alias ssh="kitty +kitten ssh"
      alias icat="kitten icat"
      alias ls="eza --icons"
      alias sys_update="sudo nixos-rebuild switch --flake $HOME/.dots#nixos"
      alias user_update="home-manager switch --flake $HOME/.dots#myamusashi"

      #Environment Variables
      set -gx PATH $HOME/go/bin $HOME/.cargo/bin $HOME/.npm/bin $HOME/.local/bin $PATH
      set -gx EDITOR 'nvim -u $HOME/.config/nvim/init.lua'
      set -g fish_greeting

      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

    '';
  };
}

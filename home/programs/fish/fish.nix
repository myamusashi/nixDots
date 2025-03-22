{pkgs, ...}: {
  imports = [./starship.nix];
  programs.fish = {
    enable = true;

    shellInit = ''
         alias ssh "kitty +kitten ssh"
         alias icat "kitten icat"
         alias ls "eza --icons"
         alias sys_update "sudo nixos-rebuild switch --flake $HOME/.dots#nixos"
         alias user_update "home-manager switch --flake $HOME/.dots#myamusashi"

         fish_add_path /home/myamusashi/.spicetify
         set -gx PATH $HOME/go/bin $HOME/.cargo/bin $HOME/.npm/bin $HOME/.local/bin $PATH
         set -gx EDITOR 'nvim -u $HOME/.config/nvim/init.lua'
         set -g fish_greeting

         ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

      if set -q IN_NIX_SHELL
          if test -f /home/myamusashi/.conda/bin/conda
              eval (/home/myamusashi/.conda/bin/conda "shell.fish" "hook" $argv)
       			else
           			if test -f "/home/myamusashi/.conda/etc/fish/conf.d/conda.fish"
                  . "/home/myamusashi/.conda/etc/fish/conf.d/conda.fish"
           			else
                  set -x PATH "/home/myamusashi/.conda/bin" $PATH
           			end
       			end
      end
    '';
  };
}

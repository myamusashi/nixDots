{pkgs, ...}: {
  imports = [./starship.nix];
  programs.fish = {
    enable = true;

    shellInit = ''
        fastfetch

        #Shortcut
        alias ssh="kitty +kitten ssh"
        alias ls="eza --icons"
				alias sys_update="sudo nixos-rebuild switch --flake $HOME/.dots#nixos"
				alias user_update="home-manager switch --flake $HOME/.dots#myamusashi"

        #Environment Variables
        set -gx PATH $HOME/go/bin $HOME/.cargo/bin $HOME/.npm/bin $HOME/.local/bin $PATH
        set -gx EDITOR 'nvim -u $HOME/.config/nvim/init.lua'
        set -g fish_greeting

      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

        # function y
        # 	set tmp (mktemp -t "yazi-cwd.XXXXXX")
        # 	yazi $argv --cwd-file="$tmp"
        # 	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        # 		builtin cd -- "$cwd"
        # 	end
        # 	rm -f -- "$tmp"
        # end
    '';
  };
}

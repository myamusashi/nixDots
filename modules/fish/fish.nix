{
  imports = [ ./starship.nix ];
  programs.fish = {
    enable = true;

    shellInit = ''
      fastfetch

      #Shortcut
      alias ssh="kitty +kitten ssh"
      alias neo="neovide --no-vsync --opengl --neovim-bin nvim"
      alias ls="eza --icons"

      #Environment Variables
      set -gx PATH $HOME/go/bin $HOME/.cargo/bin $HOME/.npm/bin $HOME/.local/bin $PATH
      set -gx EDITOR 'nvim -u $HOME/.config/nvim/init.lua'
      set -g fish_greeting

      # function y
      # 	set tmp (mktemp -t "yazi-cwd.XXXXXX")
      # 	yazi $argv --cwd-file="$tmp"
      # 	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      # 		builtin cd -- "$cwd"
      # 	end
      # 	rm -f -- "$tmp"
      # end

      # pnpm
      set -gx PNPM_HOME "/home/gilang/.local/share/pnpm"
      if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
      end

    '';
  };
}

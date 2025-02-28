{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
    ];
    theme = {
      name = "kanagawa";
      injectCss = true;
      src = pkgs.fetchFromGitHub {
        owner = "myamusashi";
        repo = "kanagawa";
        rev = "main";
        hash = "sha256-fsE1C3l0FsvEdDYiYNoUxm/kswfxBrkAEclsKGG40N4=";
      };
    };
    # customColorScheme = {
    #   kanagawa = {
    #     topbar = "2A2A37";
    #     topbar-text = "DCD7BA";
    #     topbar-subtext = "363646";
    #     tab-active = "1E1F28";
    #     tab-active-text = "DCD7BA";
    #     tab-hover = "16161D";
    #     topbar-border = "2A2A37";
    #
    #     ## sidebars
    #     sidebar = "2A2A37";
    #     sidebar-text = "DCD7BA";
    #     link-active-text = "DCD7BA";
    #     sidebar-border = "2A2A37";
    #
    #     ## main view
    #     main = "1E1F28";
    #     text = "b9bcc6";
    #     subtext = "7e8596";
    #     selected-row = "5b6b79";
    #
    #     ## player bar
    #     player = "141b1f";
    #     player-text = "969aa9";
    #     player-subtext = "6d8392";
    #     player-selected-row = "6d8392";
    #     player-border = "141b1f";
    #
    #     ## accent colors
    #     link-hover-text = "009587";
    #     link-active = "009587";
    #     button = "01bfa5";
    #     button-active = "01bfa5";
    #     scrollbar-hover = "009688";
    #
    #     ## others
    #     button-disabled = "2c353e";
    #     scrollbar = "39454f";
    #     context-menu = "2A2A37";
    #     context-menu-text = "DCD7BA";
    #     context-menu-hover = "343e47";
    #     card = "232d35";
    #     shadow = "101418";
    #     notification = "1E1F28";
    #     notification-error = "b73434";
    #     misc = "39454f";
    #
    #     ## ylx
    #     main-elevated = "1E1F28";
    #     highlight-elevated = "232d35";
    #     highlight = "20272d";
    #   };
    # };
  };
}

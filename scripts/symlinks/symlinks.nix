{lib, ...}: {
  home.activation.iconLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.nix-profile/share/icons/* $HOME/.icons
  '';
  home.activation.hyprScriptsLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.dots/home/programs/hypr/scripts /tmp/scripts
  '';
  home.activation.themeLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.nix-profile/share/themes/* $HOME/.themes
  '';
  home.activation.discordCSS = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.dots/scripts/discord_theme.css $HOME/.config/vesktop/settings/quickCss.css
  '';
  # home.activation.extHD = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   ln -sf /run/media/apalah $HOME/external_drive
  # '';
  # home.activation.extSSD = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   ln -sf /run/media/extn $HOME/ssd
  # '';
}

{lib}: {
  themesLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.nix-profile/share/themes $HOME/.themes
  '';
  iconLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.nix-profile/share/icons $HOME/.icons
  '';
  hyprScriptsLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.dots/home/programs/hypr/scripts /tmp/scripts
  '';
}

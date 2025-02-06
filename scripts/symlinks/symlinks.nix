{lib, ...}: {
  home.activation.iconLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.nix-profile/share/icons $HOME/.icons
  '';
  home.activation.hyprScriptsLinkAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $HOME/.dots/home/programs/hypr/scripts /tmp/scripts
  '';
}

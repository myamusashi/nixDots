{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.neovim
    pkgs.wget
    pkgs.ntfs3g
    pkgs.gccgo14
    pkgs.polkit
    pkgs.tree-sitter
    pkgs.libGL
    pkgs.libGLU
    pkgs.pciutils
    pkgs.mesa
    pkgs.vulkan-tools
    pkgs.intel-vaapi-driver
    pkgs.vmware-workstation
    pkgs.cloudflare-warp
    pkgs.mlocate
    pkgs.upower
    pkgs.upower-notify
  ];
}

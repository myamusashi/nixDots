{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vim
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
    pkgs.ciscoPacketTracer8
    pkgs.mlocate
    pkgs.gns3-gui
    pkgs.gns3-server
    pkgs.dynamips
    pkgs.wireshark
    pkgs.ubridge
    pkgs.busybox
    pkgs.inetutils
    pkgs.vpcs
    pkgs.docker
    pkgs.libvirt
    pkgs.python3
    pkgs.upower
    pkgs.upower-notify
    ## For deepseek LLM stuff
    pkgs.libjpeg
    ## For gns3
    pkgs.virt-viewer
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    ntfs3g
    vulkan-tools
    libgdiplus
    winetricks
    polkit
    tree-sitter
		libgcc
    libGL
    libGLU
    pciutils
    mesa
    ffmpeg-full
    vulkan-tools
    vmware-workstation
    cloudflare-warp
    udiskie
    udisks
    # ciscoPacketTracer8
    linux-wifi-hotspot
    gns3-gui
    gns3-server
    dynamips
    wireshark
    ubridge
    busybox
    inetutils
    vpcs
    docker
    libvirt
    python3
    upower
    upower-notify
    ## For gns3
    virt-viewer
  ];
}

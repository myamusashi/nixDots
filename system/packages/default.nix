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
    proton-ge-custom
    libgcc
    libGL
    libGLU
    pciutils
    blesh
    onlyoffice-desktopeditors
    ffmpeg
    pcsx2
    apacheHttpd
    vulkan-tools
    (
      vmware-workstation.overrideAttrs (e: {
        installPhase = ''
               ${e.installPhase}

               mv $out/bin/vmware $out/bin/vmware-bin
               makeWrapper $out/bin/vmware-bin $out/bin/vmware \
                 --set GTK_THEME "Adwaita-dark"

               if [ -f $out/share/applications/vmware-workstation.desktop ]; then
                 substituteInPlace $out/share/applications/vmware-workstation.desktop \
                   --replace "Exec=@@BINARY@@" "Exec=$out/bin/vmware"

                 substituteInPlace $out/share/applications/vmware-player.desktop \
                   --replace "Exec=@@BINARY@@" "Exec=$out/bin/vmware"
          fi
        '';

        # Make sure makeWrapper is available
        nativeBuildInputs = (e.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
      })
    )
    cloudflare-warp
    android-tools
    udiskie
    udisks
    wineWowPackages.waylandFull
    winetricks
    carlito
    jflap
    netbeans
    gparted
    vsftpd
    filezilla
    mtpfs
    gvfs
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

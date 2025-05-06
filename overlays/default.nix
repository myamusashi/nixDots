final: prev: {
  kitty = prev.kitty.overrideAttrs (oldAttrs: {
    patches =
      (oldAttrs.patches or [])
      ++ [
        ./patch/kitty-patch/fix_wl_platform_toplevel.patch
        ./patch/kitty-patch/fix_xdg_toplevel_switch.patch
      ];
  });

  vesktop = prev.vesktop.overrideAttrs (oldAttrs: {
    env = {
      ELECTRON_SKIP_BINARY_DOWNLOAD = "0";
    };
  });

  vmware-workstation = prev.vmware-workstation.overrideAttrs (oldAttrs: let
    version = "17.6.1";
    build = "24319023";
    baseUrl = "https://web.archive.org/web/20241105192443if_/https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${version}/${build}/linux";
    vmware-unpack-env = prev.buildFHSEnv {
      pname = "vmware-unpack-env";
      inherit version;
      targetPkgs = pkgs: [pkgs.zlib];
    };
  in {
    src =
      prev.fetchzip {
        url = "${baseUrl}/core/VMware-Workstation-${version}-${build}.x86_64.bundle.tar";
        hash = "sha256-VzfiIawBDz0f1w3eynivW41Pn4SqvYf/8o9q14hln4s=";
        stripRoot = false;
      }
      + "/VMware-Workstation-${version}-${build}.x86_64.bundle";
    unpackPhase = ''
      ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${final.vmware-workstation.src} --extract unpacked"
    '';
  });
}

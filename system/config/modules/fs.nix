{
  # fileSystems."/" = {
  #   device = "/dev/disk/by-label/ROOT";
  #   fsType = "ext4";
  #   options = [
  #     "default"
  #     "noatime"
  #     "discard"
  #   ];
  # };

  fileSystems."/run/media/apalah" = {
    device = "/dev/disk/by-label/apalah";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "umask=022"
      "nofail"
      "automount"
    ];
  };

  fileSystems."/run/media/extn" = {
    device = "/dev/disk/by-label/extn";
    fsType = "ext4";
    options = [
      "noatime"
      "uid=1000"
      "gid=100"
      "umask=022"
      "discard"
      "nofail"
      "automount"
    ];
  };
}

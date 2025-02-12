{
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
      "nodiratime"
      "uid=1000"
      "gid=100"
      "umask=022"
      "discard"
      "nofail"
      "automount"
    ];
  };

  systemd.tmpfiles.rules = [
    "L /run/media/apalah - - - - /home/myamusashi/external_drive"
    "L /run/media/extn - - - - /home/myamusashi/ssd"
  ];
}

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
    ];
		noCheck = true;
  };

  fileSystems."/run/media/extn" = {
    device = "/dev/disk/by-label/extn";
    fsType = "ext4";
    options = [
      "rw"
      "user"
      "nofail"
      "exec"
      "umask=000"
    ];
		noCheck = true;
  };
}

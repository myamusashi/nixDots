{
  fileSystems = {
    "/run/media/apalah" = {
      device = "/dev/disk/by-label/apalah";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "auto"
        "users"
        "uid=1000"
        "gid=100"
        "umask=022"
        "nofail"
      ];
      noCheck = true;
    };

    "/run/media/extn" = {
      device = "/dev/disk/by-label/extn";
      fsType = "ext4";
      options = [
        "rw"
        "auto"
        "users"
        "nofail"
        "exec"
				"X-mount.owner=myamusashi"
      ];
      noCheck = true;
    };
  };
}

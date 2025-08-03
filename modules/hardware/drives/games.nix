{lib, ...}: {
  fileSystems."/mnt/data" = lib.mkForce {
    device = "/dev/disk/by-uuid/C4E4E56AE4E55EE4";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "noatime"
      "umask=000"
      "nofail"
      "x-gvfs-show"
      "x-systemd.mount-timeout=5"
    ];
  };
}

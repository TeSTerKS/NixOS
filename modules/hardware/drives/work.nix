{lib, ...}: {
  fileSystems."/mnt/work" = lib.mkForce {
    device = "/dev/disk/by-uuid/97d2f454-f0dd-4ecf-ad75-402a0cc8e572";
    fsType = "ext4";
    options = [
      "defaults" # Default flags
      "async" # Run all operations async
      "nofail" # Don't error if not plugged in
      "x-gvfs-show" # Show in file explorer
      "x-systemd.mount-timeout=5" # Timout for error
      "X-mount.mkdir" # Make dir if it doesn't exist
    ];
  };
}

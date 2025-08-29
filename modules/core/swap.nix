{ config, pkgs, ... }:

{
  # Создание swapfile
  swapDevices = [
    {
      device = "/swap/swapfile";
      #size = 16384; # размер в MB
    };
  ];

  # Дополнительные опции (опционально)
  boot.resumeDevice = "/dev/disk/by-label/crypted-nixos"; # для hibernation
}

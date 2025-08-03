{pkgs, ...}: {
  imports = [./hooks.nix];

  # virt-manager
  programs.virt-manager.enable = true;

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };

  # packages
  environment.systemPackages = with pkgs; [
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    spice-vdagent
    win-virtio
    win-spice
    kasmweb
  ];
  # Enable Kasm 
  # TODO: Проба использования локального сервиса 
  services.kasmweb = {
     enable = true;
     listenPort = 9999;
     defaultAdminPassword = "TesterikS"; # сменить при последующей настройке
   };
  
  # Enable Docker #Добавлена поддержка докера и пользователя 
  virtualisation.docker = {
     enable = true;
     rootless = {
       enable = true;
       setSocketVariable = true;
       daemon.settings.features.cdi = true;
     };
   };
  users.extraGroups.docker.members = [ "tektus" ];

  # virtualisation
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm; # TODO: Test
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };
    };
    spiceUSBRedirection.enable = true;
  };
}

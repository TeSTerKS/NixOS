{pkgs, ...}: {
  systemd = {
    packages = with pkgs; [libreoffice-fresh];
    services.libreoffice-fresh.wantedBy = ["multi-user.target"];
  };
  environment.systemPackages = with pkgs; [libreoffice-fresh];
}

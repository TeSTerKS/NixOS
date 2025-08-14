{pkgs, ...}: {
  systemd = {
    packages = with pkgs; [mupdf];
    services.mupdf.wantedBy = ["multi-user.target"];
  };
  environment.systemPackages = with pkgs; [
    mupdf
    
    ];
}

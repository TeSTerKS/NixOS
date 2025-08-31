{
  lib,
  pkgs,
  config,
  ...
}:
let

  nvidiaDriverChannel = config.boot.kernelPackages.nvidiaPackages.legacy_470; # stable, latest, beta, etc. legacy_470
in
{
  environment.sessionVariables = lib.optionalAttrs config.programs.hyprland.xwayland.enable {
    NVD_BACKEND = "direct";
    GBM_BACKEND = "nvidia-drm";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # MOZ_DISABLE_RDD_SANDBOX = 1; # Potential security risk

    __GL_GSYNC_ALLOWED = "0"; # GSync
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "mesa"
    "nvidia"
    "nvidiaLegacy470"
  ]; # or "nvidiaLegacy470", etc.
  boot.kernelParams = lib.optionals (lib.elem "nvidia" config.services.xserver.videoDrivers) [
    "nvidia-drm.modeset=1"
    # "nvidia_drm.fbdev=1"
  ];
  hardware = {
    nvidia = {
      # modesetting.enable = true;
      open = false;
      # nvidiaPersistenced = true;
      forceFullCompositionPipeline = true;
      nvidiaSettings = true;
      powerManagement.enable = false; # This can cause sleep/suspend to fail.
      powerManagement.finegrained = false;
      modesetting.enable = true;

      #package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
      package = nvidiaDriverChannel;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        #sync.enable = true;
        #reverseSync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    graphics = {
      enable = true;
      package = nvidiaDriverChannel;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
  nixpkgs.config = {
    nvidia.acceptLicense = true;
    cudaSupport = true;
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "cudatoolkit"
        "nvidia-persistenced"
        "nvidia-settings"
        "nvidia-x11"
      ];
  };
  hardware.opengl.extraPackages = with pkgs; [
    mesa
  ];
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [
    mesa
  ];

  nix.settings = {
    substituters = [ "https://cuda-maintainers.cachix.org" ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };
  specialisation = {
    nvidia-sync.configuration = {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware.nvidia.prime = {
        offload.enable = lib.mkForce false;
        offload.enableOffloadCmd = lib.mkForce false;
        #reverseSync.enable = true;
        sync.enable = lib.mkForce true;
      };
    };
  };
}

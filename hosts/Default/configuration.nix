{
  pkgs,
  videoDriver,
  hostname,
  browser,
  editor,
  terminal,
  terminalFileManager,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/video/${videoDriver}.nix # Enable gpu drivers defined in flake.nix
    #../../modules/hardware/video/nvidia_old.nix # Включение поддержки старых карт NVIDIA
    ../../modules/hardware/drives

    ../common.nix
    ../../modules/scripts

    ../../modules/desktop/hyprland # Enable hyprland window manager
    # ../../modules/desktop/i3-gaps # Enable i3 window manager

    #../../modules/programs/games
    ../../modules/programs/browser/${browser} # Set browser defined in flake.nix
    ../../modules/programs/terminal/${terminal} # Set terminal defined in flake.nix
    ../../modules/programs/editor/${editor} # Set editor defined in flake.nix
    ../../modules/programs/editor/vscode #Добавил установку VSCode по умолчанию внезависимости от выбора редактора
    ../../modules/programs/cli/${terminalFileManager} # Set file-manager defined in flake.nix
    ../../modules/programs/cli/starship
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/direnv
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/cava
    ../../modules/programs/cli/btop
    ../../modules/programs/shell/bash
    ../../modules/programs/shell/zsh
    #../../modules/programs/misc/nh
    #../../modules/programs/media/discord
    ../../modules/programs/media/spicetify
    ../../modules/programs/media/youtube-music
    ../../modules/programs/media/thunderbird
    ../../modules/programs/media/obs-studio
    ../../modules/programs/media/mpv
    ../../modules/programs/misc/tlp
    ../../modules/programs/misc/thunar
    #../../modules/programs/misc/lact # GPU fan, clock and power configuration
    ../../modules/programs/misc/nix-ld
    #../../modules/programs/misc/virt-manager
    ../../modules/programs/editor/libreoffice-fresh
    ../../modules/programs/editor/mupdf
    ../../modules/misc/gc
  ];

  # Home-manager config
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        # pokego # Overlayed
        krita
        #github-desktop
        gimp
        # Обезательно к установке
        telegram-desktop
        obsidian
        unrar

        # Более новая версия
        hunspellDicts.ru-ru # Русский словарь
        hunspellDicts.en-us # Английский словарь
      ];
    })
  ];

  # Define system packages here
  environment.systemPackages = with pkgs; [
  ];

  networking.hostName = hostname; # Set hostname defined in flake.nix

  # Stream my media to my devices via the network
  #services.minidlna = {
  #  enable = true;
  #  openFirewall = true;
  #  settings = {
  #    friendly_name = "NixOS-DLNA";
  #    media_dir = [
  #      # A = Audio, P = Pictures, V, = Videos, PV = Pictures and Videos.
  #      # "A,/mnt/work/Pimsleur/Russian"
  #      "/mnt/work/Pimsleur"
  #      "/mnt/work/Media/Films"
  #      "/mnt/work/Media/Series"
  #      "/mnt/work/Media/Videos"
  #      "/mnt/work/Media/Music"
  #    ];
  #    inotify = "yes";
  #    log_level = "error";
  #  };
  #};
  #users.users.minidlna = {
  #  extraGroups = ["users"]; # so minidlna can access the files.
  #};
}

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  /* Nix Settings */
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  /* Bootloader */
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "1"; # Looks better on larger screens

  boot.loader.efi.canTouchEfiVariables = true;

  /* Networking */
  time.timeZone = "America/Chicago";

  networking = {
    hostName = "pyrrha";
    networkmanager.enable = true;
  };

  /* Power Management */
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };

  /* Desktop Environment */
  # SDDM
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;
  
  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  /* Miscellaneous */
  # Firmware Updater
  services.fwupd.enable = true;

  services.tailscale.enable = true;

  /* Users */
  users.users.lynn = {
    description = "Ophelia Rozniak";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  system.stateVersion = "23.11";
}

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  /* Bootloader */
  boot.loader = {
    systemd-boot.enable = true;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  /* Networking */
  time.timeZone = "America/Chicago";

  networking = {
    hostName = "pyrrha";
    networkmanager.enable = true;
  };

  /* Sound */
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  /* X11 */
  services.xserver = {
    enable = true;
    # Set keymap
    layout = "us";
    # Enable KDE Plasma
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
  
  /* Users */
  users.users.lynn = {
    description = "Ophelia Rozniak";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  system.stateVersion = "23.05";
}

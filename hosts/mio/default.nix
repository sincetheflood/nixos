{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # User accounts
    ../../users/lynn
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
    hostName = "mio";
    networkmanager.enable = true;
    firewall.enable = false; # Too much hassle for a personal desktop
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

  system.stateVersion = "22.11";
}

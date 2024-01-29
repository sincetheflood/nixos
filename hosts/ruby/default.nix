{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  /* Bootloader */
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "1";

  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" "xfs" ];

  /* Nix Settings */
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nixpkgs.config.allowUnfree = true;

  /* Networking */
  time.timeZone = "America/Chicago";

  networking = {
    hostName = "ruby";
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
    # Enable KDE Plasma
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  services.tailscale = {
    enable = true;
  };

  /* Users */
  users.users.lynn = {
    description = "Ophelia Rozniak";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "23.11";
}

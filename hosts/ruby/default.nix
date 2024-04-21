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

  nixpkgs.config.allowUnfree = true;

  /* Bootloader */
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "1";

  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" "xfs" ];

  /* Networking */
  time.timeZone = "America/Chicago";

  networking = {
    hostName = "ruby";
    networkmanager.enable = true;
    firewall.enable = false; # Too much hassle for a personal desktop
  };

  /* Desktop Environment */
  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
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
  # Tailscale
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

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    cyanrip
  ];

  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    userName = "Ophelia Rozniak";
    userEmail = "dev@ophelia.ink";
  };

  home.stateVersion = "22.11";
}

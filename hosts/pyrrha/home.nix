{ pkgs, ... }:

{

  imports =
    [
      ../../packages/git # import default git configuration
    ];

  programs.firefox.enable = true;

  home.stateVersion = "23.11";
}

{ pkgs, ... }:

{
  imports =
    [
      ../../packages/git # import default git configuration
    ];

  home.packages = with pkgs; [
    jetbrains.webstorm
    kate
    krita
  ];

  programs.firefox = {
    enable = true;

    profiles.Default = {
      id = 0;
      extraConfig = ''
        user_pref("devtools.toolbox.zoomValue", "1.25");
      '';
    };
  };

  programs.direnv = {
    enable = true;

    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  home.stateVersion = "23.11";
}

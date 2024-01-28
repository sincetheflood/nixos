{ pkgs, ... }:

{
  imports =
    [
      ../../packages/git # import default git configuration
    ];

  # Enable font installation
  # https://nix-community.github.io/home-manager/options.xhtml#opt-fonts.fontconfig.enable
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains.webstorm
    kate
    krita
    # fonts
    fg-virgil
  ];

  programs.bash = {
    enable = true;
  };

  programs.direnv = {
    enable = true;

    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.firefox = {
    enable = true;

    profiles.Default = {
      id = 0;
      extraConfig = ''
        user_pref("devtools.toolbox.zoomValue", "1.25");
      '';
    };
  };

  home.stateVersion = "23.11";
}

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
    # art
    krita
    inkscape
    # coding
    devenv
    kate
    vscodium
    # fonts
    fg-virgil
    # media
    vlc
    # utilities
    file
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

  programs.helix = {
    enable = true;
  };

  xdg.configFile."helix/config.toml".text = ''
  theme = "onedark"
  '';

  home.stateVersion = "23.11";
}

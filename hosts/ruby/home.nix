{ pkgs, ... }:

{
  imports =
    [
      ../../packages/git # import default git configuration
    ];

  home.packages = with pkgs; [
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

  home.stateVersion = "23.11";
}

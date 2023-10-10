{ pkgs, ... }:

{

  imports =
    [
      ../../packages/git # import default git configuration
    ];

  programs.firefox = {
    enable = true;

    profiles.Default = {
      id = 0;
      extraConfig = ''
        user_pref("devtools.toolbox.zoomValue", "1.5");
      '';
    };
  };

  home.stateVersion = "23.11";
}

{ pkgs, ... }:

{

  home.packages = with pkgs; [
    cyanrip
  ];

  programs.firefox = {
    enable = true;

    profiles.Default = {
      id = 0;
      extraConfig = ''
        user_pref("devtools.toolbox.zoomValue", 1.5);
      '';
    };
  };

  programs.git = {
    enable = true;
    userName = "Ophelia Rozniak";
    userEmail = "dev@ophelia.ink";
  };

  home.stateVersion = "22.11";
}

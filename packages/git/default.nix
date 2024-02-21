{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Ophelia Rozniak";
    userEmail = "dev@ophelia.ink";
    extraConfig = {
      diff = { algorithm = "histogram"; };
      init = { defaultBranch = "main"; };
    };
  };
}

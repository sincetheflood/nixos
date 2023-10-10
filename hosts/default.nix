{ config, pkgs, ... }:

{
  /* Nix settings */
  nix.settings = {
    # Enable flakes by default
    experimental-features = [ "nix-command" "flakes" ];
  };
}

{ config, pkgs, ... }: {
  imports = [
    ../../modules/default.nix
    ../../shared/default.nix
  ];
  networking.hostName = "dtop";
  system.stateVersion = "25.05";
}

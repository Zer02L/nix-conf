{ config, pkgs, ... }: {
  imports = [
    ../../modules/default.nix
    ../../shared/default.nix
  ];
  boot.kernelParams = [ "nohibernate" ];
  networking.hostName = "dtop";
  system.stateVersion = "25.05";
}

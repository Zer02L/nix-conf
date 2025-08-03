{ config, pkgs, ... }: {
  imports = [
    ../../modules/default.nix
    ../../shared/default.nix
  ];
  networking.hostName = "laptop";
}

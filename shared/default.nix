{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./common-packages.nix
    ./packages.nix
  ];
}

{ config, pkgs, ... }:

{
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    v2rayn
  ];
}
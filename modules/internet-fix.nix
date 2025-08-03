{ config, pkgs, ... }:

{
  services.sing-box.enable = true;
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    v2rayn
    nekoray
    zapret
  ];
}

{ config, pkgs, ... }:

{
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 80 443 8080 ];
  networking.firewall.allowedUDPPorts = [ 53 51820 48601 ];
}


{ config, pkgs, ... }:
{
  imports = [
    ./env.nix
    # ./mime.nix
    ./nh.nix
    # ./zram.nix
    ./audio.nix
    ./boot.nix
    ./devices.nix
    ./firewall.nix
    ./kde.nix
    ./locale.nix
    ./networking.nix
    # ./packages.nix
    ./settings.nix
    ./ssh.nix
    ./x11.nix
    ./zsh.nix
  ];
}



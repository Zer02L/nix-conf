{ config, pkgs, user, ... }:
let
      user = "zerg";
in
{

  imports = [

    import ./nh.nix { inherit pkgs lib user; }
    ./env.nix
    # ./mime.nix
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



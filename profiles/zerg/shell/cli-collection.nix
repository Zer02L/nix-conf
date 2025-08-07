{ pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    microfetch onefetch starfetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    gnugrep
    bat eza fd bottom ripgrep-all
    rsync
    zip unzip
    w3m
    pandoc
    hwinfo
    pciutils
    numbat
    # (pkgs.callPackage ../pkgs/pokemon-colorscripts.nix { })
    # (pkgs.writeShellScriptBin "airplane-mode" ''
    #   #!/bin/sh
    #   connectivity="$(nmcli n connectivity)"
    #   if [ "$connectivity" == "full" ]
    #   then
    #       nmcli n off
    #   else
    #       nmcli n on
    #   fi
    # '')
    vim neovim
  ];
}

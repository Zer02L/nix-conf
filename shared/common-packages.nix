{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    yazi
    git
    curl
    wget
    btop
    home-manager
  ];
}


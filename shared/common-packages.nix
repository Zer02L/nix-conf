{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    yazi
    git
    curl
    wget
    btop
    microfetch
    home-manager
  ];
}


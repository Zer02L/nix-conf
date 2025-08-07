{ pkgs, ... }:

{
  services.flatpak.package.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

  environment.systemPackages = with pkgs; [
    gcc
    curl
    wget
    git
    yazi
    vim
    btop
    neovim
    microfetch
    home-manager
  ];
}


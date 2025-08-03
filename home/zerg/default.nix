{ config, pkgs, ... }:

{
  home.username = "zerg";
  home.homeDirectory = "/home/zerg"; # замени alice на имя пользователя в системе
  imports = [
    ./firefox.nix
    ./git.nix
    ./gui-pkgs.nix
    ./librewolf.nix
    ./neovim.nix
    ./ohmyposh.nix
    ./pkgs.nix
    ./shells.nix
    ./vscode.nix
    ./yazi.nix
    ./zed-editor.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05";
}
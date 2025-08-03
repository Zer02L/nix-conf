{ config, pkgs, ... }:

{
  home.username = "zerg";
  home.homeDirectory = "/home/zerg"; # замени alice на имя пользователя в системе
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./eza.nix
    ./lazygit.nix
    ./obsidian.nix
    # ./stylix.nix # brake
    ./tmux.nix
    ./zathrua.nix

    ./firefox.nix
    ./git.nix

    ./librewolf.nix
    ./neovim.nix
    ./ohmyposh.nix
    ./shells.nix
    # ./vscode.nix # требует настройки
    # ./zed-editor.nix # требует настройки
    ./yazi.nix
    ./zsh.nix
    ./home-pkgs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05";
}

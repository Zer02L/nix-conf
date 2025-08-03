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
    ./stylix.nix
    ./tmux.nix
    ./zathrua.nix
    
    ./firefox.nix
    ./git.nix
    ./pkgs-gui.nix
    ./pkgs-cli.nix
    ./librewolf.nix
    ./neovim.nix
    ./ohmyposh.nix
    ./shells.nix
    ./vscode.nix
    ./yazi.nix
    ./zed-editor.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05";
}
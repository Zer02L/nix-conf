{ config, pkgs, inputs, ... }:

{
  home.username = "zerg";
  home.homeDirectory = "/home/zerg"; # замени alice на имя пользователя в системе

  
  imports = [
    # ./crush.nix
    ./app/browser/firefox.nix
    ./app/browser/librewolf.nix
    ./app/nvim/nvim.nix
    ./app/git.nix
    ./app/obsidian.nix
    # ./app/vscode.nix # требует настройки
    # ./app/zed-editor.nix # требует настройки

    ./app/terminal/alacritty.nix
    ./app/terminal/kitty.nix

    ./shell/sh.nix
    ./shell/ohmyposh.nix
    ./shell/cli-collection.nix
    ./shell/cli/eza.nix
    ./shell/cli/lazygit.nix
    ./shell/cli/tmux.nix
    ./shell/cli/yazi.nix
    ./shell/cli/zathrua.nix
    # ./shell/cli

    ./stylix.nix # brake

    ./home-pkgs.nix
    

  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05";
}

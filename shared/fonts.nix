{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    maple-mono.NF
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}


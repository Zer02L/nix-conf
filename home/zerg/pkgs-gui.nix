{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    anki # knowlege
    obsidian # notes

    kdePackages.kate # KDE editor

    # media
    krita # paint
    reaper # audio edit
    blender # 3d
    brave # browser

    # massanger
    telegram-desktop
    vesktop 

  ];
}
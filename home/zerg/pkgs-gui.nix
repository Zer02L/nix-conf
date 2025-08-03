{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    anki # knowlege
    obsidian # notes


    alacritty
    kitty
    asdf-vm
    lazygit
    vscode-fhs
    zed-editor-fhs
    kdePackages.kate # KDE editor


    # media
    krita # paint
    davinci-resolve
    blender # 3d
    obs-studio
    brave # browser

    audacious
    reaper # audio edit

    # massanger
    telegram-desktop
    vesktop 

    imv
    mpv


    # # Desktop apps
    # anki
    # code-cursor
    # imv
    # mpv
    # obs-studio
    # obsidian
    # pavucontrol
    # teams-for-linux
    # telegram-desktop
    # vesktop

    # # CLI utils
    # bc
    # bottom
    # brightnessctl
    # cliphist
    # ffmpeg
    # ffmpegthumbnailer
    # fzf
    # git-graph
    # grimblast
    # htop
    # hyprpicker
    # ntfs3g
    # mediainfo
    # microfetch
    # playerctl
    # ripgrep
    # showmethekey
    # silicon
    # udisks
    # ueberzugpp
    # unzip
    # w3m
    # wget
    # wl-clipboard
    # wtype
    # yt-dlp
    # zip

    # # Coding stuff
    # openjdk23
    # nodejs
    # python311

    # # WM stuff
    # libsForQt5.xwaylandvideobridge
    # libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland

    # # Other
    # bemoji
    # nix-prefetch-scripts


  ];
}
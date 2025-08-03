{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    
    ##### Desktop apps #####

    anki # knowlege
    obsidian # notes
    onlyoffice

    # code editors
    vscode-fhs
    # code-cursor
    zed-editor-fhs
    kdePackages.kate # KDE editor

    # media
    krita # paint
    # davinci-resolve # brake
    blender # 3d
    obs-studio
    brave # browser

    audacious
    reaper # audio edit

    # massanger
    telegram-desktop
    vesktop 
    bitwarden-desktop

    imv
    mpv


    # pavucontrol
    # teams-for-linux

    alacritty
    kitty

    ##### CLI #####
    tmux
    neovim
    yazi
    wget

    fzf # fuzzyfinder
    eza
    btop # htop
    ripgrep-all # ripgrep
    cliphist
    yt-dlp

    zip
    unzip

    microfetch
    mediainfo

    brightnessctl
    grimblast

    ntfs3g
    playerctl

    #dev
    git
    git-graph
    lazygit


    asdf-vm
    
    ## Coding stuff
    # JS/TS
    nodejs_24
    pnpm
    bun
    biome

    go

    python311

    # Other
    bemoji
    nix-prefetch-scripts


    # # WM stuff
    # libsForQt5.xwaylandvideobridge
    # libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland



    # # CLI utils
    # bc
    # bottom
    # ffmpeg
    # ffmpegthumbnailer
    # fzf
    # git-graph
    # grimblast
    # hyprpicker
    # ntfs3g
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


    # # Other
    # bemoji
    # nix-prefetch-scripts


  ];
}

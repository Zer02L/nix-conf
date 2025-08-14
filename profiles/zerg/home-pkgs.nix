{ pkgs, config, inputs, ... }:
let
  system = "x86_64-linux" ;
in
{
  home.packages = with pkgs; [
    
    ##### Desktop apps #####

    anki # knowlege
    obsidian # notes
    onlyoffice-desktopeditors

    # code editors
    vscode-fhs code-cursor-fhs zed-editor-fhs
    kdePackages.kate # KDE editor

    # media
    krita # paint
    # davinci-resolve # brake
    blender # 3d
    obs-studio
    brave # browser

    audacious reaper # audio edit

    # massanger
    telegram-desktop vesktop 
    bitwarden-desktop

    imv
    mpv


    # pavucontrol
    # teams-for-linux

    alacritty kitty

    #### CLI #####

    crush
    qwen-code
    # inputs.nix-ai-tools.packages.${system}.crush # cruch ai cli
    # inputs.nix-ai-tools.packages.${system}.qwen-code # qwen ai cli
    # inputs.nix4nvchad.packages.${system}.nvchad

    tmux
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
    git git-graph lazygit


    asdf-vm
    
    ## Coding stuff
    # JS/TS
    nodejs_24 pnpm bun
    biome
    
    # Go lang
    go hugo templ docker docker-slim

    # Python
    python311 ruff uv

    # Other
    bemoji
    nix-prefetch-scripts


    # # WM stuff
    # libsForQt5.xwaylandvideobridge
    # libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland
    wl-clipboard



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

{
  description = "Модульная NixOS + Home Manager конфигурация (шаблон)";

  inputs = {
    # Основные каналы
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

    # Пины для отдельных пакетов
    emacs-pin-nixpkgs.url = "nixpkgs/f72123158996b8d4449de481897d855bc47c7bf6";
    kdenlive-pin-nixpkgs.url = "nixpkgs/cfec6d9203a461d9d698d8a60ef003cac6d0da94";
    nwg-dock-hyprland-pin-nixpkgs.url = "nixpkgs/2098d845d76f8a21ae4fe12ed7c7df49098d3f15";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager-unstable = {
    #   url = "github:nix-community/home-manager/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # home-manager-stable = {
    #   url = "github:nix-community/home-manager/release-25.05";
    #   inputs.nixpkgs.follows = "nixpkgs-stable";
    # };

    # Дополнительные инструменты
    sops-nix.url = "github:Mic92/sops-nix";
    nix-ai-tools.url = "github:numtide/nix-ai-tools";

    stylix = {
      # url = "github:danth/stylix";
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.3-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Прочие модули — оставляем закомментированными
    # nix-on-droid = { ... };
    # hyprland = { ... };
    # hyprland-plugins = { ... };
    # hyprlock = { ... };
    # hyprgrass.url = "...";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nix-doom-emacs.inputs.nixpkgs.follows = "emacs-pin-nixpkgs";

    nix-straight.url = "github:librephoenix/nix-straight.el/pgtk-patch";
    nix-straight.flake = false;
    nix-doom-emacs.inputs.nix-straight.follows = "nix-straight";

    nvchad = {
      url = "github:NvChad/starter";
      flake = false;
    };

    # Emacs плагины
    eaf = { url = "github:emacs-eaf/emacs-application-framework"; flake = false; };
    eaf-browser = { url = "github:emacs-eaf/eaf-browser"; flake = false; };
    org-nursery = { url = "github:chrisbarrett/nursery"; flake = false; };
    org-yaap = { url = "gitlab:tygrdev/org-yaap"; flake = false; };
    org-side-tree = { url = "github:localauthor/org-side-tree"; flake = false; };
    org-timeblock = { url = "github:ichernyshovvv/org-timeblock"; flake = false; };
    org-krita = { url = "github:librephoenix/org-krita"; flake = false; };
    org-xournalpp = { url = "gitlab:vherrmann/org-xournalpp"; flake = false; };
    org-sliced-images = { url = "github:jcfk/org-sliced-images"; flake = false; };
    magit-file-icons = { url = "github:librephoenix/magit-file-icons/abstract-icon-getters-compat"; flake = false; };
    phscroll = { url = "github:misohena/phscroll"; flake = false; };
    mini-frame = { url = "github:muffinmad/emacs-mini-frame"; flake = false; };

    # Rust Overlay
    rust-overlay.url = "github:oxalica/rust-overlay";

    # Блокировщик рекламы
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }:
  let
    lib = nixpkgs.lib;

    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "desktop"; # hostname
      profile = "zerg"; # select a profile defined from my profiles directory
      timezone = "America/Chicago"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      gpuType = "nvidia"; # amd, intel or nvidia; only makes some slight mods for amd at the moment
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "zerg";
      name = "z";
      email = "z@librephoenix.com";
      theme = "io";
      wm = "hyprland";
      wmType = if wm == "hyprland" || wm == "plasma" then "wayland" else "x11";
      browser = "librewolf";
      spawnBrowser =
        if browser == "qutebrowser" && wm == "hyprland" then "qutebrowser-hyprprofile"
        else if browser == "qutebrowser" then "qutebrowser --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4"
        else browser;
      defaultRoamDir = "Personal.p";
      term = "alacritty";
      font = "Intel One Mono";
      editor = "neovide";
      spawnEditor =
        if editor == "emacsclient" then "emacsclient -c -a 'emacs'"
        else if elem editor [ "vim" "nvim" "nano" ] then "exec ${term} -e ${editor}"
        else if editor == "neovide" then "neovide -- --listen /tmp/nvimsocket"
        else editor;
    };

    # pkgs c overlay для crush и qwen-code
    pkgs = import nixpkgs {
      system = systemSettings.system;
      overlays = [
        inputs.rust-overlay.overlays.default
        (final: prev: {
          crush = inputs.nix-ai-tools.packages.${systemSettings.system}.crush;
          qwen-code = inputs.nix-ai-tools.packages.${systemSettings.system}.qwen-code;
        })
      ];
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

  in {
    # --- NixOS ---
    nixosConfigurations = {
      "${systemSettings.hostname}" = nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          stylix.nixosModules.stylix
          (./. + "/users" + ("/" + userSettings.username) + ".nix")
          ./shared/default.nix
          ./modules/default.nix
          (./. + "/hosts" + ("/" + systemSettings.hostname) + "/configuration.nix")
          (./. + "/hosts" + ("/" + systemSettings.hostname) + "/hardware-configuration.nix")
        ];
        specialArgs = { inherit inputs systemSettings userSettings; };
      };
    };

    # --- Home Manager ---
    homeConfigurations = {
      "${userSettings.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        system = systemSettings.system;

        modules = [
          stylix.homeModules.stylix
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
        ];

        extraSpecialArgs = {
          inherit inputs userSettings systemSettings;
        };
      };
    };
  };
}

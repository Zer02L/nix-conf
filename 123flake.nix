{
  description = "Модульная NixOS + Home Manager конфигурация (шаблон)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    emacs-pin-nixpkgs.url = "nixpkgs/f72123158996b8d4449de481897d855bc47c7bf6";
    kdenlive-pin-nixpkgs.url = "nixpkgs/cfec6d9203a461d9d698d8a60ef003cac6d0da94";
    nwg-dock-hyprland-pin-nixpkgs.url = "nixpkgs/2098d845d76f8a21ae4fe12ed7c7df49098d3f15";


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

    # nix-on-droid = {
    #   url = "github:nix-community/nix-on-droid/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager-unstable";
    # };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland/v0.40.1?submodules=true";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprland-plugins = {
    #   type = "git";
    #   url = "https://code.hyprland.org/hyprwm/hyprland-plugins.git";
    #   rev = "4d7f0b5d8b952f31f7d2e29af22ab0a55ca5c219"; #v0.44.1
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hyprlock = {
    #   type = "git";
    #   url = "https://code.hyprland.org/hyprwm/hyprlock.git";
    #   rev = "73b0fc26c0e2f6f82f9d9f5b02e660a958902763";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprgrass.url = "github:horriblename/hyprgrass/427690aec574fec75f5b7b800ac4a0b4c8e4b1d5";
    # hyprgrass.inputs.hyprland.follows = "hyprland";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nix-doom-emacs.inputs.nixpkgs.follows = "emacs-pin-nixpkgs";

    nix-straight.url = "github:librephoenix/nix-straight.el/pgtk-patch";
    nix-straight.flake = false;
    nix-doom-emacs.inputs.nix-straight.follows = "nix-straight";

    nvchad = {
      url = "github:NvChad/starter";
      flake = false;
    };

    eaf = {
      url = "github:emacs-eaf/emacs-application-framework";
      flake = false;
    };
    eaf-browser = {
      url = "github:emacs-eaf/eaf-browser";
      flake = false;
    };
    org-nursery = {
      url = "github:chrisbarrett/nursery";
      flake = false;
    };
    org-yaap = {
      url = "gitlab:tygrdev/org-yaap";
      flake = false;
    };
    org-side-tree = {
      url = "github:localauthor/org-side-tree";
      flake = false;
    };
    org-timeblock = {
      url = "github:ichernyshovvv/org-timeblock";
      flake = false;
    };
    org-krita = {
      url = "github:librephoenix/org-krita";
      flake = false;
    };
    org-xournalpp = {
      url = "gitlab:vherrmann/org-xournalpp";
      flake = false;
    };
    org-sliced-images = {
      url = "github:jcfk/org-sliced-images";
      flake = false;
    };
    magit-file-icons = {
      url = "github:librephoenix/magit-file-icons/abstract-icon-getters-compat";
      flake = false;
    };
    phscroll = {
      url = "github:misohena/phscroll";
      flake = false;
    };
    mini-frame = {
      url = "github:muffinmad/emacs-mini-frame";
      flake = false;
    };


    rust-overlay.url = "github:oxalica/rust-overlay";

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
  };

  # COMING SOON...
  #nixvim = {
  #  url = "github:nix-community/nixvim";
  #  inputs.nixpkgs.follows = "nixpkgs";
  #};

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }:
  let

    # pkgs = import nixpkgs { ${ systemSettings.system } };
    lib = nixpkgs.lib;
    # extraSpecialArgs = { inherit system inputs; };  # <- passing inputs to the attribute set for home-manager

    # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux"; # system arch
        hostname = "desktop"; # hostname
        profile = "zerg"; # select a profile defined from my profiles directory
        timezone = "America/Chicago"; # select timezone
        locale = "en_US.UTF-8"; # select locale
        # bootMode = "uefi"; # uefi or bios
        # bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
        # grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
        gpuType = "nvidia"; # amd, intel or nvidia; only makes some slight mods for amd at the moment
      };
    # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "zerg";
        name = "z"; # name/identifier
        email = "z@librephoenix.com"; # email (used for certain configurations)
        # dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
        theme = "io"; # selcted theme from my themes directory (./themes/)
        wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # window manager type (hyprland or x11) translator
        wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
        browser = "librewolf"; # Default browser; must select one from ./user/app/browser/
        spawnBrowser = if ((browser == "qutebrowser") && (wm == "hyprland")) then "qutebrowser-hyprprofile" else (if (browser == "qutebrowser") then "qutebrowser --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4" else browser); # Browser spawn command must be specail for qb, since it doesn't gpu accelerate by default (why?)
        defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
        term = "alacritty"; # Default terminal command;
        font = "Intel One Mono"; # Selected font
        # fontPkg = pkgs.intel-one-mono; # Font package
        editor = "neovide"; # Default editor;
        # editor spawning translator
        # generates a command that can be used to spawn editor inside a gui
        # EDITOR and TERM session variables must be set in home.nix or other module
        # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
        spawnEditor = if (editor == "emacsclient") then
                        "emacsclient -c -a 'emacs'"
                      else
                        (if ((editor == "vim") ||
                             (editor == "nvim") ||
                             (editor == "nano")) then
                               "exec " + term + " -e " + editor
                         else
                         (if (editor == "neovide") then
                           "neovide -- --listen /tmp/nvimsocket"
                           else
                           editor));
  };
  # nixpkgs-patched =
  #       (import inputs.nixpkgs { system = systemSettings.system; rocmSupport = (if systemSettings.gpu == "amd" then true else false); }).applyPatches {
  #         name = "nixpkgs-patched";
  #         src = inputs.nixpkgs;
  #         patches = [ #./patches/emacs-no-version-check.patch
  #                     #./patches/nixpkgs-348697.patch
  #                   ];
  #       };
  # # configure pkgs
  #     # use nixpkgs if running a server (homelab or worklab profile)
  #     # otherwise use patched nixos-unstable nixpkgs
  #     pkgs = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
  #             then
  #               pkgs-stable
  #             else
  #               (import nixpkgs-patched {
  #                 system = systemSettings.system;
  #                 config = {
  #                   allowUnfree = true;
  #                   allowUnfreePredicate = (_: true);
  #                 };
  #                 overlays = [ inputs.rust-overlay.overlays.default ];
  #               }));

  #     pkgs-stable = import inputs.nixpkgs-stable {
  #       system = systemSettings.system;
  #       config = {
  #         allowUnfree = true;
  #         allowUnfreePredicate = (_: true);
  #       };
  #     };

  #     pkgs-unstable = import inputs.nixpkgs-patched {
  #       system = systemSettings.system;
  #       config = {
  #         allowUnfree = true;
  #         allowUnfreePredicate = (_: true);
  #       };
  #       overlays = [ inputs.rust-overlay.overlays.default ];
  #     };

  #     pkgs-emacs = import inputs.emacs-pin-nixpkgs {
  #       system = systemSettings.system;
  #     };

  #     pkgs-kdenlive = import inputs.kdenlive-pin-nixpkgs {
  #       system = systemSettings.system;
  #     };

  #     pkgs-nwg-dock-hyprland = import inputs.nwg-dock-hyprland-pin-nixpkgs {
  #       system = systemSettings.system;
  #     };

  #     # configure lib
  #     # use nixpkgs if running a server (homelab or worklab profile)
  #     # otherwise use patched nixos-unstable nixpkgs
  #     lib = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
  #            then
  #              inputs.nixpkgs-stable.lib
  #            else
  #              inputs.nixpkgs.lib);

  #     # use home-manager-stable if running a server (homelab or worklab profile)
  #     # otherwise use home-manager-unstable
  #     home-manager = (if ((systemSettings.profile == "homelab") || (systemSettings.profile == "worklab"))
  #            then
  #              inputs.home-manager-stable
  #            else
  #              inputs.home-manager-unstable);

  #     # Systems that can run tests:
  #     supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

  #     # Function to generate a set based on supported systems:
  #     forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

  #     # Attribute set of nixpkgs for each system:
  #     nixpkgsFor =
  #       forAllSystems (system: import inputs.nixpkgs { inherit system; });
  in {
    # nixosConfigurations = {
    #   system = lib.nixosSystem {
    #     system = systemSettings.system;
    #     modules = [
    #       (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
    #       # inputs.lix-module.nixosModules.default
    #       ./system/bin/phoenix.nix
    #     ];
    #   };
    nixosConfigurations = {
      "${systemSettings.hostname}" = nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          stylix.nixosModules.stylix
          # ./users/zerg.nix
          (./. + "/users" + ("/" + userSettings.username) + ".nix")

          ./shared/default.nix
          ./modules/default.nix

          # ./hosts/desktop/configuration.nix
          # ./hosts/desktop/hardware-configuration.nix
          (./. + "/hosts" + ("/" + systemSettings.hostname) + "/configuration.nix") # load configuration.nix from selected PROFILE
          (./. + "/hosts" + ("/" + systemSettings.hostname) + "/hardware-configuration.nix")
        ];
        specialArgs = { inherit inputs systemSettings userSettings; };
      };
    };


    homeConfigurations = {
    "${userSettings.username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { 
          system = systemSettings.system;
          overlays = [
            (final: prev: {
              crush = inputs.nix-ai-tools.packages.${systemSettings.system}.crush;
              qwen-code = inputs.nix-ai-tools.packages.${systemSettings.system}.qwen-code;
            })
          ];
        };
        modules = [
          stylix.homeModules.stylix
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
        ];
        extraSpecialArgs = {
          # inherit inputs; 
          # pass config variables from above

          # inherit pkgs-stable;
          # inherit pkgs-emacs;
          # inherit pkgs-kdenlive;
          # inherit pkgs-nwg-dock-hyprland;
          # inherit systemSettings;
          inherit inputs userSettings;
          # inherit inputs;
      };
      # и так далее для других пользователей
    };
  };
  };
}

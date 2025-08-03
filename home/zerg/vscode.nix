{ config, pkgs, ... }:

{
  # VSCode с расширениями и настройками через NixOS + Home Manager
  programs.vscode = {
    enable = true;

    profiles = {
      default = {

      extensions = with pkgs.vscode-extensions; [
        vue.volar
        golang.go
        biomejs.biome
        christian-kohler.path-intellisense

        esbenp.prettier-vscode
        bbenoist.nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "codeium";
          publisher = "Codeium";
          version = "1.5.9";
          sha256 = "sha256-6PLn7g/znfc2uruYTqxQ96IwXxfz6Sbguua3YqZd64U=";
        }
      ];
        userSettings = {
          "files.autoSave" = "onFocusChange";
          "editor.formatOnSave" = false;
          "editor.fontFamily" = "Maple Mono";
        };
      };
    };
  };
}
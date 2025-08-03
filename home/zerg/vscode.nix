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

      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # {
        #   name = "Kilo Code AI Agent (Cline / Roo features combined)";
        #   publisher = "Kilo Code";
        #   version = "4.72.15";
        #   sha256 = "sha256:8f4defef88461f241ade62db74f01ddf391ce2b1a80057f53a31a010d0a88429";
        # }
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
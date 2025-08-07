# Пример: дополнительные пакеты
{ config, pkgs, inputs, ... }: {  # <-- inputs from flake
  # ...
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nix4nvchad.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  environment.systemPackages = with pkgs; [
    # vimPlugins.nvchad
  code-cursor-fhs
  ollama-cuda
  ];
}

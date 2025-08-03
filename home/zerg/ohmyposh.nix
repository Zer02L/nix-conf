{ config, pkgs, lib, ... }:

{

  programs.oh-my-posh = {
    # enable = true;
    
    # Использование официальной темы oh-my-posh
    # useTheme = "agnoster";
    
    # Если хочешь кастомные настройки, можно написать в settings
    # settings = {
    #   segments = [ ... ];
    # };
    enable = true;
    useTheme = "paradox";
    
    builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"))

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}


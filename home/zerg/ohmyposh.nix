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
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}


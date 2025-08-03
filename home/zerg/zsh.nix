{ config, pkgs, ... }:

{
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "agnoster";
    shellAliases = {
      ll = "ls -alF";
      gs = "git status";
    };
  };
}


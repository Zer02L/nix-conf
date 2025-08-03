{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # (необязательно) дополнительные пакеты для LSP, форматтеров и прочего:
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages."@vue/language-server" # Vue LSP
      go
      gopls
      lua-language-server
      # любые нужные тебе инструменты
    ];
    
    # (необязательно) автоматическое создание backup старой конфигурации
    # Вставить lua-скрипт или vimscript для backup
    extraConfig = ''
      set backup
      set backupdir=~/.config/nvim/backups//
    '';
    # (необязательно) твой chadrcConfig (заменит chadrc.lua):
    # chadrcConfig = builtins.readFile ./custom_chadrc.lua;
  };
}
{ pkgs, ... }:
let

  # My shell aliases
  myAliases = {
    nrs = "sudo nixos-rebuild switch --flake";
    hms = "home-manager switch --flake .";
    ll = "ls -alF";

    gs = "git status";
    gp = "git push";
    gc = "git commit -m ";

    yy = "yazi";

    crush = "nix run github:numtide/nix-ai-tools#crush";

    ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btop";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "microfetch";
    fetch = "microfetch";
    gitfetch = "onefetch";
    "," = "comma";
  };

  themeData = builtins.fromJSON (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json");

in
{
  programs.zsh = {
    enable = true;
    # enableAutosuggestions = true;
    # oh-my-zsh.enable = true;
    # oh-my-zsh.theme = "agnoster";
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initContent = ''
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    microfetch onefetch 
    gnugrep gnused
    bat eza 
    btop bottom
    fzf fd bc
    direnv nix-direnv
  ];

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

    # builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"));

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

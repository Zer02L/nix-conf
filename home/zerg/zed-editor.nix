{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "elixir"
      "make"
    ];
    userSettings = {
      vim_mode = true;
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      ui_font_size = 16;
      buffer_font_size = 16;
      auto_install_extensions = true;
      terminal = {
        dock = "bottom";
        font_family = "Maple Mono NF"; # FiraCode Nerd Font Mono
        detect_venv = {
          on = {
            directories = [".env" "env" ".venv" "venv"];
            activate_script = "default";
          };
        };
      };
      # Можно добавить и другие настройки по вкусу
    };
  };
}

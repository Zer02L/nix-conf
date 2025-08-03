{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };
  services.xserver.xkb.options = "grp:alt_shift_toggle"; # если нужно переключение
}

{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.enable = false;

  # # Для классического BIOS или EFI, где нужен GRUB, добавь:
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.devices = [ "/dev/sda" ];  # или другой путь к загрузочному диск

  
  boot.initrd.luks.devices."luks-855ad126-5f00-4dee-8484-05af2f736c63".device = "/dev/disk/by-uuid/855ad126-5f00-4dee-8484-05af2f736c63";
}
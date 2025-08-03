{ config, pkgs, ... }:

{
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";       # или "prohibit-password" и др.
  services.openssh.settings.PasswordAuthentication = false;
  users.users.zerg.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3...userkey"
  ];
}


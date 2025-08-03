# Пример шаблона для нового хоста
{ config, pkgs, ... }: {
  imports = [
    ../../modules/default.nix
    ../../shared/default.nix
  ];
  networking.hostName = "имя_хоста";
  # Добавь уникальные настройки хоста ниже
}

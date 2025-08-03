# Пример шаблона для пользователя (системные настройки)
{ config, pkgs, ... }: {
    users.users.zerg = {
    isNormalUser = true;           # или isSystemUser, но только ОДНО!
    group = "zerg";                # обязательно добавить
    extraGroups = [ "wheel" "networkmanager" ];     # wheel — для прав sudo (по желанию)
    shell = pkgs.zsh;              # если нужен определённый shell
};
  users.groups.zerg = {};
    # Добавь другие параметры
}

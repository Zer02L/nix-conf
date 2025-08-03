{ config, pkgs, ... }: {


  # Определяем пользователя с именем "zerg"
  users.users.zerg = {
    
    # Это обычный пользователь (не системный)
    # isNormalUser = true;
    isSystemUser = true;

    # Описание (для удобства)
    description = "Пользователь zerg";

    # Обязательно указываем основную группу пользователя
    group = "users";
    home = "/home/zerg";

    # Дополнительные группы, например wheel для sudo, networkmanager для доступа к сети
    extraGroups = [ "wheel" "networkmanager" ];

    # Оболочка по умолчанию (zsh из nixpkgs)
    shell = pkgs.zsh;

    # Пароль (если хочешь указать прямо, но лучше использовать hashedPassword)
    # password = "секрет";  # НЕ рекомендуется в открытом виде
    # hashedPassword = "sha256:цена_хэша_пароля"; # безопаснее
  };

  # Создаем группу с именем "zerg"
  # users.groups.zerg = {};

}
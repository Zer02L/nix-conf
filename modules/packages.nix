# Пример: дополнительные пакеты
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    htop
    neofetch
  ];
}

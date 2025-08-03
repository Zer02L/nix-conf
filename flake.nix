{
  description = "Модульная NixOS + Home Manager конфигурация (шаблон)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # laptop = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     ./hosts/laptop/configuration.nix
      #     ./modules/default.nix         # общий импорт модулей
      #     ./shared/default.nix          # общий импорт общих настроек
      #   ];
      # };
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./users/zerg.nix
          ./home/zerg/internet-fix.nix
          ./shared/default.nix
          ./modules/default.nix
          ./hosts/desktop/configuration.nix
          ./hosts/desktop/hardware-configuration.nix
        ];
      };
    };
    homeConfigurations = {
      zerg = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [
          ./home/zerg/default.nix
        ];
      };
      # и так далее для других пользователей
    };
  };
}

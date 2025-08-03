# Основная документация

- Описание структуры файлов

/nix-config
├── flake.nix
├── flake.lock
├── README.md                   # Описание структуры и назначения файлов
├── examples/                   # Шаблоны для новых хостов/пользователей
│   ├── host-example.nix
│   └── user-example.nix
├── shared/                     # Общие модули для всех хостов/пользователей
│   ├── common-packages.nix
│   ├── fonts.nix
│   └── ...
├── modules/                    # Персонализированные или часто используемые модули
│   ├── default.nix             # Автоматический импорт всех модулей
│   ├── networking.nix
│   ├── packages.nix
│   ├── zsh.nix
│   └── ...
├── hosts/                      # Конфиги для каждого компьютера
│   ├── laptop/
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── desktop/
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── users/                      # Системные настройки пользователей
│   ├── alice.nix
│   └── bob.nix
├── home/                       # Настройки через Home Manager (dotfiles, user-space)
│   ├── alice/
│   │   ├── default.nix         # Импорт всех модулей пользователя
│   │   ├── apps.nix
│   │   ├── zsh.nix
│   │   └── git.nix
│   └── bob/
│       ├── default.nix
│       └── ...
├── secrets/                    # Только для приватных данных, в .gitignore!
│   └── ...

- Как создать пользователя, хост, добавить модуль


-- home/ - home-massanger

-- hosts/ - устройства

-- users/ - настройки пользователя

-- flake.nix - точка входа

-- shared/ - 

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**: If you haven't already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.
2. **Clone the Repository**:

	```bash
    git clone https://github.com/Zer02L/nix-conf
    cd nix-conf
    ```

3. **Copy one of the hosts configuration to set up your own**:

    ```bash
    cd hosts
    cp -r zerg <your_hostname>
    cd <your_hostname>
    ```

4. **Put your `hardware-configuration.nix` file there**:

    ```bash
    cp /etc/nixos/hardware-configuration.nix ./
    ```

5. **Edit `hosts/<your_hostname>/local-packages.nix` and `nixos/packages.nix` files if needed**:

    ```bash
    vim local-packages.nix
    vim ../../nixos/packages.nix
    ```

6. **Finally, edit the `flake.nix` file**:

    ```diff
    ...
      outputs = { self, nixpkgs, home-manager, ... }@inputs: let
        system = "x86_64-linux";
    --  homeStateVersion = "25.05";
    ++  homeStateVersion = "<your_home_manager_state_version>";
    --  user = "zerg";
    ++  user = "<your_username>";
        hosts = [
    --    { hostname = "slim3"; stateVersion = "25.05"; }
    --    { hostname = "330-15ARR"; stateVersion = "25.05"; }
    ++    { hostname = "<your_hostname>"; stateVersion = "<your_state_version>"; }
        ];
    ...
    ```

7. **Rebuilding**:

    ```bash
    cd nix-conf
    git add .
    nixos-rebuild switch --flake ./#<hostname>
    # or nixos-install --flake ./#<hostname> if you are installing on a fresh system
    home-manager switch
    ```

## 😎 Enjoy!

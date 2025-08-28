{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              label = "boot";
              name = "ESP";
              size = "250M";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            luks = {
              size = "100%";
              label = "luks";

              content = {
                type = "luks";
                name = "cryptroot";

                extraOpenArgs = [
                  "--allow-discards"
                  "--perf-no_read_workqueue"
                  "--perf-no_write_workqueue"
                ];

                # Настройки для поддержки расшифровки с Fido2 (YubiKey)
                settings = { crypttabExtraOpts = ["fido2-device=auto" "token-timeout=5"]; };

                content = {
                  type = "btrfs";
                  extraArgs = ["-L" "nixos" "-f"];

                  subvolumes = {
                    root = {
                      mountpoint = "/";
                      mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                    };
                    home = {
                      mountpoint = "/home";
                      mountOptions = [ "subvol=home" "compress=zstd" "noatime" ];
                    };
                    nix = {
                      mountpoint = "/nix";
                      mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ];
                    };
                    persist = {
                      mountpoint = "/persist";
                      mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ];
                    };
                    log = {
                      mountpoint = "/var/log";
                      mountOptions = [ "subvol=log" "compress=zstd" "noatime" ];
                    };
                    tmp = {
                      mountpoint = "/tmp";
                      mountOptions = [ "subvol=tmp" "compress=none" "noatime" ];
                    };
                    vartmp = {
                      mountpoint = "/var/tmp";
                      mountOptions = [ "subvol=vartmp" "compress=none" "noatime" ];
                    };
                    games = {
                      mountpoint = "/games";
                      mountOptions = [ "subvol=games" "compress=none" "noatime" ];
                    };
                    swap = {
                      mountpoint = "/swap";
                      swap.swapfile.size = "4G";
                      mountOptions = [ "subvol=swap" "nodatacow" "compress=none" "noatime" ];  # откоючает CoW для swap в реальной конфигурации
                      
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}

{ self, ... }: {
  flake.modules.nixos.base =
    { config, lib, ... }:
    {
      options.dzu.users = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.submodule ({
          options = {
            enable = lib.mkEnableOption "Enable user";
            name = lib.mkOption {
              type = lib.types.str;
              description = "User's name";
            };
            description = lib.mkOption {
              type = lib.types.str;
              description = "User's full name";
            };
            extraGroups = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Groups the user is apart of";
            };
            module = lib.mkOption {
              type = lib.types.deferredModuleWith {
                imports = with self.modules.hm; [
                  base
                  gui
                ];
              };
              description = "User's HM module";
            };
          };

          config = {
            users.users.${config.name} = {
              isNormalUser = true;
              inherit (config) description;
              extraGroups = lib.mkMerge [
                config.extraGroups
                config.dzu.usersDefaultGroups
              ];
            };

            home-manager.users.${config.name} = {
              imports = [ config.module ];
            };
          };
        });
        description = "Attrset containing user submodules";
      };
      options.dzu.usersDefaultGroups = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "Default groups for all users";
      };
    };
}

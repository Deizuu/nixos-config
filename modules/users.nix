{
  flake.modules.nixos.base =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.users;
      userSubmodule = lib.types.submodule (
        { name, ... }: {
          options = {
            enable = lib.mkEnableOption "Enable user";
            name = lib.mkOption {
              type = lib.types.str;
              default = name;
              description = "User name";
            };
            description = lib.mkOption {
              type = lib.types.str;
              description = "User's full name";
            };
            extraGroups = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              description = "Groups the user is apart of";
            };
            shell = lib.mkOption {
              type = lib.types.package;
              description = "User shell";
              default = pkgs.zsh;
            };
            module = lib.mkOption {
              type = lib.types.deferredModule;
              description = "User's HM module";
            };
          };
        }
      );
    in
    {
      options.dzu.users = lib.mkOption {
        type = lib.types.attrsOf userSubmodule;
        description = "Attrset containing user submodules";
      };
      options.dzu.usersDefaultGroups = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        description = "Default groups for all users";
      };
      config = {
        users.users = lib.mapAttrs' (name: user: {
          name = "${name}";
          value = {
            enable = user.enable;
            isNormalUser = user.enable;
            inherit (user) description shell;
            extraGroups = lib.mkMerge [
              config.dzu.usersDefaultGroups
              user.extraGroups
            ];
          };
        }) cfg;
        dzu.usersDefaultGroups = [
          "networkmanager"
          "input"
          "openrazer"
        ];
        programs.zsh.enable = true;
      };
    };
}

#   config = {
#     users.users.${config.name} = {
#       isNormalUser = true;
#       inherit (config) description shell;
#       extraGroups = lib.mkMerge [
#         config.extraGroups
#         config.dzu.usersDefaultGroups
#       ];
#     };
#
#     home-manager.users.${config.name} = {
#       imports = [ config.module ];
#     };
#   };
# }

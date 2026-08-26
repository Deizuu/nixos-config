{
  flake.modules.nixos.base =
    { config, lib, ... }:
    {
      options.dzu.users = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.lazyAttrsOf lib.types.submodule (
          { config, ... }:
          {
            options = {
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
                type = lib.types.deferredModule;
                description = "User's HM module";
              };
            };

            config = {
              users.users.${config.name} = {
                isNormalUser = true;
                inherit (config) description extraGroups;
              };

              home-manager.users.${config.name} = {
                imports = [ config.module ];
              };
            };
          }
        );
        description = "Attrset containing user submodules";
      };
    };
}

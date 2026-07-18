{ config, lib, inputs, ... }:
let
  cfg = config.my.user;
in
{
  options.my.user = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "deizu";
    };

    description = lib.mkOption {
      type = lib.types.str;
      default = "Deizu";
    };

    extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "wheel" "input" ];
    };

    home = {
      base = lib.mkOption {
        type = lib.types.deferredModule;
      };
      gui = lib.mkOption {
        type = lib.types.deferredModule;
      };
    };
  };

  config = {
    my.user.home = {inherit (config.homeManager.modules) base gui;};

    nixos.modules.base = {
      users.users.${cfg.name} = {
        isNormalUser = true;
	inherit (cfg) description extraGroups;
      };

      home-manager.users.${cfg.name} = {
        imports = [ cfg.home.base ];
      };
    };

    nixos.modules.pc = {
      home-manager.users.${cfg.name} = {
        imports = [ cfg.home.gui ];
      };
    };
  };
}

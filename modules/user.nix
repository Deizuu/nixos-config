{ config, lib, pkgs, ... }:
let
  cfg = config.my.user;
in
{
  options.my.user = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "deizu";
      description = "User name";
    };

    description = lib.mkOption {
      type = lib.types.str;
      default = "Deizu";
      description = "User description (usually full name)";
    };

    extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "wheel" ];
      description = "Extra groups for the user";
    };
  };

  config = {
    flake.modules.nixos.base = {
      users.users.${cfg.name} = {
        isNormalUser = true;
        inherit (cfg) description extraGroups;
      };
    };
  };
}

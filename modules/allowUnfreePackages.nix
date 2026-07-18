{ config, lib, ... }:
let
  cfg = config.allowUnfreePackages;
in
{
  options.allowUnfreePackages = lib.mkOption {
    type = lib.types.listOf lib.types.str;
  };

  config = {
    nixos.modules.base = {
      nixpkgs.config.allowUnfreePredicate =
        pkg: builtins.elem (lib.getName pkg) cfg;
    };
  };
}

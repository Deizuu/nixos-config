{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.allowUnfreePackages;
    in
    {
      options.dzu.allowUnfreePackages = lib.mkOption {
        type = lib.types.listOf lib.types.str;
      };

      config = {
        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) cfg;
      };
    };
}

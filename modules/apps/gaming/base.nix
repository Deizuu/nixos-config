{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.games;
    in
    {
      options.dzu.apps.games = {
        enable = lib.mkEnableOption "Enable games";
        games = lib.mkOption {
          type = lib.types.listOf lib.types.package;
          description = "Package list of games";
        };
      };
    };
}

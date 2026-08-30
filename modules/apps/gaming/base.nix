{
  flake.modules.homeManager.gui =
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
      config = lib.mkIf cfg.enable {
        home.packages = cfg.games;
      };
    };
}

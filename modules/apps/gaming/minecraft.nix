{
  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.games;
    in
    {
      programs.prismlauncher = lib.mkIf cfg.enable {
        enable = true;
      };
    };
}

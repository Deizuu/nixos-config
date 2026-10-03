{
  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.lutris;
    in
    {
      options.dzu.apps.lutris = {
        enable = lib.mkEnableOption "Enable Lutris";
      };
      config = lib.mkIf cfg.enable {
        programs.lutris = {
          enable = true;
        };
      };
    };
}

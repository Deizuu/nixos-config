{
  flake.modules.homeManager.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.rclone;
    in
    {
      options.dzu.apps.rclone = {
        enable = lib.mkEnableOption "Enable rclone";
      };
      config = lib.mkIf cfg.enable {
        programs.rclone = {
          enable = true;
        };
      };
    };
}

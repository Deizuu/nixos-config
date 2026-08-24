{
  flake.modules.nixos.autoTime =
    { config, lib, ... }:
    let
      cfg = config.dzu.autoTime;
    in
    {
      options.dzu.autoTime = {
        enable = lib.mkEnableOption "Use automatic-timezoned to set timezone (requires location services)";
      };

      config = lib.mkIf cfg.enable {
        services.automatic-timezoned.enable = true;
      };
    };
}

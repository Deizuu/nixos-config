{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.location;
    in
    {
      options.dzu.location = {
        enable = lib.mkEnableOption "Enable location services";
      };

      config = lib.mkIf cfg.enable {
        location.provider = "geoclue2";
        services.geoclue2.enable = true;
      };
    };
}

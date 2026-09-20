{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.networking.i2p;
    in
    {
      options.dzu.networking.i2p = {
        enable = lib.mkEnableOption "Enable I2P";
      };
      config = lib.mkIf cfg.enable {
        services.i2p.enable = true;
        systemd.services.i2p.wantedBy = lib.mkForce [];
      };
    };
}

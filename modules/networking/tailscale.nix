{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.networking.tailscale;
    in
    {
      options.dzu.networking.tailscale = {
        enable = lib.mkEnableOption "Enable Tailscale";
      };
      config = lib.mkIf cfg.enable {
        services.tailscale = {
          enable = true;
          authKeyFile = "/run/secrets/tailscale_key";
        };
      };
    };
}

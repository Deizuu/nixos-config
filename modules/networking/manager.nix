{
  flake.modules.nixos.networking =
    { config, lib, ... }:
    let
      cfg = config.dzu.networking;
    in
    {
      options.dzu.networking = {
        wifi.enable = lib.mkEnableOption "Enable Wi-Fi using iwd backend";
      };
      config = {
        networking = {
          wireless.iwd = lib.mkIf cfg.wifi.enable {
            enable = true;
            settings = {
              IPv6.Enabled = true;
            };
          };

          networkmanager = {
            enable = true;
            wifi.backend = lib.mkIf cfg.wifi.enable "iwd";
          };
        };
      };
    };
}

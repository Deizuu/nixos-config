{
  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.kdeconnect;
    in
    {
      options.dzu.apps.kdeconnect = {
        enable = lib.mkEnableOption "Enable KDE Connect";
      };
      config = lib.mkIf cfg.enable {
        services.kdeconnect = {
          enable = true;
          indicator = true;
        };
      };
    };

  flake.modules.nixos.base.networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}

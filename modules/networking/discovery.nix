{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.networking;
    in
    {
      options.dzu.networking = {
        discovery.enable = lib.mkEnableOption "Enable automatic network discovery with Avahi Zeroconf";
      };

      config = lib.mkIf cfg.discovery.enable {
        services.avahi = {
          enable = true;
          nssmdns4 = true;
          publish = {
            enable = true;
            addresses = true;
          };
        };
      };
    };
}

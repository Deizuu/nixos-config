{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.audio.discovery;
    in
    {
      options.dzu.audio.discovery = {
        enable = lib.mkEnableOption "Enable Zeroconf Discovery module for pipewire-pulse";
      };

      config = lib.mkIf cfg.enable {
        services.pipewire.extraConfig.pipewire-pulse."50-zeroconf-discover" = {
          "pulse.cmd" = [
            {
              cmd = "load-module";
              args = "module-zeroconf-discover";
            }
          ];
        };
      };
    };
}

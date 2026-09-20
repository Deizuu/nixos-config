{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.hotspot;
    in
    {
      options.dzu.apps.hotspot = {
        enable = lib.mkEnableOption "Enable LinuxWifiHotspot";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.linux-wifi-hotspot
        ];
      };
    };
}

{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.flatpak;
    in
    {
      options.dzu.flatpak = {
        enable = lib.mkEnableOption "Enable Flatpak";
      };
      config = lib.mkIf cfg.enable {
        services.flatpak.enable = true;
        xdg.portal.enable = true;
      };
    };
}

{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.de.gnome;
    in
    {
      options.dzu.de.gnome = {
        enable = lib.mkEnableOption "Enable GNOME desktop environment";
      };

      config = lib.mkIf cfg.enable {
        services.desktopManager.gnome = {
          enable = true;
        };
      };
    };
}

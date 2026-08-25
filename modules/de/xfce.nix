{
  flake.modules.nixos.xfce =
    { config, lib, ... }:
    let
      cfg = config.dzu.de.xfce;
    in
    {
      options.dzu.de.xfce = {
        enable = lib.mkEnableOption "Enable Xfce desktop environment";
      };

      config = lib.mkIf cfg.enable {
        services.xserver.desktopManager.xfce = {
          enable = true;
        };
        programs.xfconf.enable = true; # Xfce config storage system
      };
    };
}

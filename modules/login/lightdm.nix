{
  flake.modules.nixos.lightdm =
    { config, lib, ... }:
    let
      cfg = config.dzu.login.lightdm;
    in
    {
      options.dzu.login.lightdm = {
        enable = lib.mkEnableOption "Enable LightDM display manager";
      };

      config = lib.mkIf cfg.enable {
        services.xserver.displayManager.lightdm = {
          enable = true;
          greeters.pantheon.enable = true;
        };
      };
    };
}

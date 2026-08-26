{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.login.gdm;
    in
    {
      options.dzu.login.gdm = {
        enable = lib.mkEnableOption "Enable GDM display manager";
      };
      config = lib.mkIf cfg.enable {
        services.displayManager.gdm.enable = true;
      };
    };
}

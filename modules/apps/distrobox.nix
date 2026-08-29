{
  flake.modules.hm.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.distrobox;
    in
    {
      options.dzu.apps.distrobox = {
        enable = lib.mkEnableOption "Enable Distrobox";
      };
      config = lib.mkIf cfg.enable {
        programs.distrobox = {
          enable = true;
        };
      };
    };
}

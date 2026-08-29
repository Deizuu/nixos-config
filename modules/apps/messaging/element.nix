{
  flake.modules.hm.gui =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      cfg = config.dzu.apps.element;
    in
    {
      options.dzu.apps.element = {
        enable = lib.mkEnableOption "Enable Element";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.element-desktop
        ];
      };
    };
}

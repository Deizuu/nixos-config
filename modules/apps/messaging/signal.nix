{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.signal;
    in
    {
      options.dzu.apps.signal = {
        enable = lib.mkEnableOption "Enable Signal";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.signal-desktop
        ];
      };
    };
}

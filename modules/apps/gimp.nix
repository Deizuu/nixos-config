{
  flake.modules.homeManager.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.gimp;
    in
    {
      options.dzu.apps.gimp = {
        enable = lib.mkEnableOption "Enable GIMP";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.gimp
        ];
      };
    };
}

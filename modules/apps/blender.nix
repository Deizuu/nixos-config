{
  flake.modules.homeManager.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.blender;
    in
    {
      options.dzu.apps.blender = {
        enable = lib.mkEnableOption "Enable Blender";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.blender
        ];
      };
    };
}

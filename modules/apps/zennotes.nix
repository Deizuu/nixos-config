{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.zennotes;
    in
    {
      options.dzu.apps.zennotes = {
        enable = lib.mkEnableOption "Enable ZenNotes";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.zennotes-desktop
        ];
      };
    };
}

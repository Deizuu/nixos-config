{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.kdenlive;
    in
    {
      options.dzu.apps.kdenlive = {
        enable = lib.mkEnableOption "Enable Kdenlive";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.kdePackages.kdenlive
        ];
      };
    };
}

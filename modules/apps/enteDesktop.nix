{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.ente;
    in
    {
      options.dzu.apps.ente = {
        enable = lib.mkEnableOption "Enable Ente";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.ente-desktop
        ];
      };
    };
}

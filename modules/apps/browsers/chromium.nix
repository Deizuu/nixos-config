{
  flake.modules.hm.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.chromium;
    in
    {
      options.dzu.apps.chromium = {
        enable = lib.mkEnableOption "Enable ungoogled-chromium";
      };
      config = lib.mkIf cfg.enable {
        programs.chromium = {
          enable = true;
          package = pkgs.ungoogled-chromium;
        };
      };
    };
}

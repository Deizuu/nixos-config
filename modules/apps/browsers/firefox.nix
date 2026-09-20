{
  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.firefox;
    in
    {
      options.dzu.apps.firefox = {
        enable = lib.mkEnableOption "Enable Firefox";
      };
      config = lib.mkIf cfg.enable {
        programs.firefox.enable = true;
      };
    };
}

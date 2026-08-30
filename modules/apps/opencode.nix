{
  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.opencode;
    in
    {
      options.dzu.apps.opencode = {
        enable = lib.mkEnableOption "Enable OpenCode";
      };
      config = lib.mkIf cfg.enable {
        programs.opencode = {
          enable = true;
        };
      };
    };
}

{
  flake.modules.hm.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.opencode;
    in
    {
      options.dzu.apps.opencode = {
        enable = lib.mkenableOption "Enable OpenCode";
      };
      config = lib.mkIf cfg.enable {
        programs.opencode = {
          enable = true;
        };
      };
    };
}

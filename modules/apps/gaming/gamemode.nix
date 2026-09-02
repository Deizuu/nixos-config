{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.gamemode;
    in
    {
      options.dzu.apps.gamemode = {
        enable = lib.mkEnableOption "Enable gamemode";
      };
      config = lib.mkIf cfg.enable {
        programs.gamemode = {
          enable = true;
        };
      };
    };
}

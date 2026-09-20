{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.steam;
    in
    {
      options.dzu.apps.steam = {
        enable = lib.mkEnableOption "Enable Steam";
      };
      config = lib.mkIf cfg.enable {
        programs.steam = {
          enable = true;
          protontricks.enable = true;
        };
        dzu.allowUnfreePackages = [
          "steam"
          "steam-unwrapped"
        ];
      };
    };
}

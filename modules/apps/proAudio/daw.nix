{
  flake.modules.homeManager.gui =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.proAudio;
    in
    {
      options.dzu.apps.proAudio = {
        enable = lib.mkEnableOption "Enable pro audio apps";
      };
      config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
          ardour
          audacity
          carla
        ];
      };
    };
}

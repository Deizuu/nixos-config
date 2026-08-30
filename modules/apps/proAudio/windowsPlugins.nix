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
      config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
          yabridge
          yabridgectl

          wineWow64Packages.staging
        ];
      };
    };
}

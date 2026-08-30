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
        home.packages = [
          pkgs.calf
          pkgs.guitarix
          pkgs.lsp-plugins
          pkgs.ratatouille-lv2
          pkgs.tap-plugins
          pkgs.neural-amp-modeler-lv2
        ];
      };
    };
}

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
          calf
          guitarix
          lsp-plugins
          ratatouille-lv2
          tap-plugins
          neural-amp-modeler-lv2
          x42-avldrums
        ];
      };
    };
}

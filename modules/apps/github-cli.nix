{
  flake.modules.homeManager.base =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.github-cli;
    in
    {
      options.dzu.apps.github-cli = {
        enable = lib.mkEnableOption "Enable GitHub CLI";
      };
      config = lib.mkIf cfg.enable {
        home.packages = [
          pkgs.github-cli
        ];
      };
    };
}

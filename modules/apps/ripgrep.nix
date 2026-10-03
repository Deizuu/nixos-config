{
  flake.modules.homeManager.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.ripgrep;
    in
    {
      options.dzu.apps.ripgrep = {
        enable = lib.mkEnableOption "Enable ripgrep";
      };
      config = lib.mkIf cfg.enable {
        programs.ripgrep = {
          enable = true;
        };
      };
    };
}

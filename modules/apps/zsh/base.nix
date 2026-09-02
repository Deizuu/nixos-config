{
  flake.modules.homeManager.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.zsh;
    in
    {
      options.dzu.zsh = {
        enable = lib.mkEnableOption "Enable zsh";
      };

      config = lib.mkIf cfg.enable {
        programs.zsh = {
          enable = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
        };
      };
    };
}

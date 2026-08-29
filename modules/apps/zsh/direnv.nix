{
  flake.modules.hm.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.zsh;
    in
    {
      config = lib.mkIf cfg.enable {
        programs.direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
      };
    };
}

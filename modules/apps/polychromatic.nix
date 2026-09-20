{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.polychromatic;
    in
    {
      options.dzu.apps.polychromatic = {
        enable = lib.mkEnableOption "Enable Polychromatic";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.polychromatic
        ];
      };
    };
}

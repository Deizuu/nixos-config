{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.oversteer;
    in
    {
      options.dzu.apps.oversteer = {
        enable = lib.mkEnableOption "Enable Oversteer";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.oversteer
        ];
      };
    };
}

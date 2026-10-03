{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.hw.tablet;
    in
    {
      options.dzu.hw.tablet = {
        enable = lib.mkEnableOption "Enable tablet drivers";
      };
      config = lib.mkIf cfg.enable {
        hardware.opentabletdriver.enable = true;
      };
    };
}

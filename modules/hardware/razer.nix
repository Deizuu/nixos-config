{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.hw.razer;
    in
    {
      options.dzu.hw.razer = {
        enable = lib.mkEnableOption "Enable openrazer driver";
      };

      config = lib.mkIf cfg.enable {
        hardware.openrazer = {
          enable = true;
        };
      };
    };
}

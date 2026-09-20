{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.boot;
    in
    {
      options.dzu.boot = {
        silentBoot = lib.mkEnableOption "Silent boot (quiet kernel logs)";
        usePlymouth = lib.mkEnableOption "Enable Plymouth splash screen";
      };

      config = {
        boot.loader.grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
        };
        boot.loader.efi.canTouchEfiVariables = true;

        boot.kernelParams = lib.optionals cfg.silentBoot [
          "quiet"
        ];
        boot.plymouth.enable = lib.mkIf cfg.usePlymouth true;
      };
    };
}

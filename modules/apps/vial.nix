{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.vial;
    in
    {
      options.dzu.apps.vial = {
        enable = lib.mkEnableOption "Enable Vial";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          vial
        ];
        services.udev.packages = with pkgs; [
          vial
        ];
      };
    };
}

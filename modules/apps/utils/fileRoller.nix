{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.file-roller;
    in
    {
      options.dzu.apps.file-roller = {
        enable = lib.mkEnableOption "Enable File Roller";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.file-roller
        ];
      };
    };
}

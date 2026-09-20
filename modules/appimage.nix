{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.appimage;
    in
    {
      options.dzu.appimage = {
        enable = lib.mkEnableOption "Enable AppImage";
      };
      config = lib.mkIf cfg.enable {
        programs.appimage = {
          enable = true;
        };
      };
    };
}

{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.vlc;
    in
    {
      options.dzu.apps.vlc = {
        enable = lib.mkEnableOption "Enable VLC";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.vlc
        ];
      };
    };
}

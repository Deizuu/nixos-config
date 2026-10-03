{
  flake.modules.nixos.pc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.apps.proton-vpn;
    in
    {
      options.dzu.apps.proton-vpn = {
        enable = lib.mkEnableOption "Enable Proton VPN";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.proton-vpn
        ];
      };
    };
}

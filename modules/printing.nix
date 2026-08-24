{
  flake.modules.nixos.printing =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.printing;
    in
    {
      options.dzu.printing = {
        enable = lib.mkEnableOption "Enable printing services";
      };

      config = lib.mkIf cfg.enable {
        services.printing = {
          enable = true;

          drivers = with pkgs; [
            gutenprint
            hplip
            splix
          ];
        };
        #TODO add user to group "lpadmin"
      };
    };
}

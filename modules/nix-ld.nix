{
  flake.modules.nixos.base =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.nix-ld;
    in
    {
      options.dzu.nix-ld = {
        enable = lib.mkEnableOption "Enable nix-ld";
      };
      config = lib.mkIf cfg.enable {
        programs.nix-ld = {
          enable = true;
          libraries = with pkgs; [
            alsa-lib
            fontconfig
            freetype
            libgcc
            libx11
          ];
        };
      };
    };
}

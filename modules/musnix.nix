{ inputs, ... }: {
  flake-file.inputs.musnix = {
    url = "github:musnix/musnix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      cfg = config.dzu.audio.musnix;
    in
    {
      options.dzu.audio.musnix = {
        enable = lib.mkEnableOption "Enable Musnix";
      };
      imports = [ inputs.musnix.nixosModules.musnix ];
      musnix.enable = lib.mkIf cfg.enable true;
    };
}

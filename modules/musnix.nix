{ inputs, ... }: {
  flake-file.inputs.musnix = {
    url = "github:musnix/musnix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.pc = { config, lib, ... }: {
    imports = [ inputs.musnix.nixosModules.musnix ];
    musnix.enable = lib.mkDefault false;
  };
}

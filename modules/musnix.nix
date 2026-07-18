{ inputs, config, ... }: {
  flake-file.inputs.musnix = {
    url = "github:musnix/musnix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nixos.modules.pc = {
    imports = [
      inputs.musnix.nixosModules.musnix
    ];

    musnix.enable = true;

    users.users.${config.my.user.name}.extraGroups = [ "audio" ];
  };
}

{ inputs, ... }: {
  flake.nixosModules.musnix = { pkgs, ... }: {
    imports = [
      inputs.musnix.nixosModules.musnix
    ];

    musnix.enable = true;
  };
}

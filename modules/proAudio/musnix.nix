{ inputs, ... }: {
  flake.modules.nixos.proAudio = { pkgs, ... }: {
    imports = [
      inputs.musnix.nixosModules.musnix
    ];

    musnix.enable = true;
  };
}

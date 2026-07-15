{ self, inputs, ... }: {
  flake.nixosModules.tabletDriver = { pkgs, ... }: {
    hardware.opentabletdriver.enable = true;
  };
}

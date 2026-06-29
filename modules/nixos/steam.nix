{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, ... }: {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    programs.steam = {
      enable = true;
      protontricks.enable = true;
    };
  };
}

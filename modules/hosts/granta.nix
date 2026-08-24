{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [
      granta
      grantaHardware
    ];
  };

  flake.modules.nixos.granta = {

    # Disable TPM2 to fix systemd hang
    boot.initrd.systemd.tpm2.enable = false;
    systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

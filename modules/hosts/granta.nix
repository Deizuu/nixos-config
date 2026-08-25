{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [
      granta
      grantaHardware

      pc
    ];
  };

  flake.modules.nixos.granta = {
    dzu.boot.silentBoot = true;
    dzu.boot.usePlymouth = true;

    dzu.autoTime.enable = true;
    dzu.location.enable = true;

    dzu.login.gdm.enable = true;
    dzu.de.gnome.enable = true;

    # dzu.home-manager.enable = true;

    dzu.networking = {
      wifi.enable = true;
      discovery.enable = true;
    };
    
    dzu.printing.enable = true;

    # Disable TPM2 to fix systemd hang
    boot.initrd.systemd.tpm2.enable = false;
    systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

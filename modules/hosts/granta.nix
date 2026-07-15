{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      grantaConfiguration
      
      # System
      audioPipewire
      bootGranta
      chromebookSetup
      desktopGnome
      networking
      printing
      
      # Config
      homeManager
      musnix
      nixSettings
      pwJackConfig
      user
    ];
  };

  flake.nixosModules.grantaConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.grantaHardware
    ];

    programs.git.enable = true;

    services.automatic-timezoned.enable = true;
    
    boot.kernelPackages = pkgs.linuxPackages_latest;

    systemd.tpm2.enable = false; # Disable TPM2 because of start job wait time
    boot.initrd.systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      grantaConfiguration
      
      # System
      audioPipewire
      bootGranta
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

    programs.zsh.enable = true;
    programs.git.enable = true;

    services.automatic-timezoned.enable = true;

    systemd.tpm2.enable = false; # Disable TPM2 because of start job wait time
    boot.initrd.systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      grantaConfiguration
      
      # System
      audioPipewire
      boot
      desktopGnome
      networking
      printing
      
      # Config
      homeManager
      musnix
      nixSettings
      user
    ];
  };

  flake.nixosModules.grantaConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.grantaHardware
    ];
    my.user.enable = true;

    programs.zsh.enable = true;
    programs.git.enable = true;

    services.automatic-timezoned.enable = true;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

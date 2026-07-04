{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      grantaConfiguration
      
      audioPipewire
      boot
      desktopGnome
      homeManager
      networking
      nixSettings
      printing
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

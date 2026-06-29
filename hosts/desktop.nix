{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktopConfiguration
      
      audioPipewire
      boot
      desktopEnvironment
      networking
      nixSettings
      nvidiaKepler
      printing
    ];
  };

  flake.nixosModules.desktopConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.desktopHardware
    ];
    
    services.automatic-timezoned.enable = true;

    networking.hostName = "nixos-desktop";
    system.stateVersion = "26.05";
  };
}

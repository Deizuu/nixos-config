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
      user
    ];
  };

  flake.nixosModules.desktopConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.desktopHardware
    ];
    my.user.enable = true;

    services.automatic-timezoned.enable = true;

    networking.hostName = "nixos-desktop";
    system.stateVersion = "26.05";
  };
}

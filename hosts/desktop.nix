{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules.nixos; [
      desktopConfiguration
      
      audioPipewire
      boot
      desktopEnvironment
      locale
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

    networking.hostname = "nixos-desktop";
    system.stateVersion = "26.05";
  };
}

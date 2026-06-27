{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
	  self.nixosModules.desktopHardware
	  self.nixosModules.desktopModule
      
	  self.nixosModules.audioPipewire
      self.nixosModules.boot
	  self.nixosModules.desktopEnvironment
	  self.nixosModules.locale
	  self.nixosModules.networking
	  self.nixosModules.nixSettings
	  self.nixosModules.nvidiaKepler
	  self.nixosModules.printing
	];
  };

  flake.nixosModules.desktopModule = { pkgs , ... }: {
    networking.hostname = "nixos-desktop";
	system.stateVersion = "26.05";
  };
}

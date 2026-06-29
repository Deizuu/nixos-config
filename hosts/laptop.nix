{ self, inputs, ... }: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      laptopConfiguration
      
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

  flake.nixosModules.laptopConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.laptopHardware
    ];
    my.user.enable = true;

    programs.zsh.enable = true;

    services.automatic-timezoned.enable = true;

    networking.hostName = "nixos-desktop";
    system.stateVersion = "26.05";
  };
}

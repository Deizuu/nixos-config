{ self, inputs, ... }: {
  flake.nixosConfigurations.vesta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      vestaConfiguration
      
      audioPipewire
      boot
      desktopEnvironment
      homeManager
      networking
      nixSettings
      nvidiaKepler
      printing
      steam
      user
    ];
  };

  flake.nixosModules.vestaConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.vestaHardware
    ];
    my.user.enable = true;

    programs.zsh.enable = true;
    programs.git.enable = true;

    services.automatic-timezoned.enable = true;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

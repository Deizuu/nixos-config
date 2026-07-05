{ self, inputs, ... }: {
  flake.nixosConfigurations.vesta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      vestaConfiguration
      
      # System
      audioPipewire
      boot
      desktopEnvironment
      networking
      nvidiaKepler
      printing

      # Config
      homeManager
      musnix
      nixSettings
      pwJackConfig
      user

      # Programs
      steam
    ];
  };

  flake.nixosModules.vestaConfiguration = { pkgs , ... }: {
    imports = [
      self.nixosModules.vestaHardware
    ];

    programs.zsh.enable = true;
    programs.git.enable = true;

    services.automatic-timezoned.enable = true;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

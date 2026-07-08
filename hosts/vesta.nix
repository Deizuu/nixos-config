{ self, inputs, ... }: {
  flake.nixosConfigurations.vesta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      vestaConfiguration
      
      # System
      audioPipewire
      bootVesta
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

    programs.nix-ld.enable = true; # Allow running unpackaged executables

    environment.systemPackages = with pkgs; [ # Add Vial to configure keyboard
      vial
      clonehero
    ];
    services.udev.packages = with pkgs; [ # Add udev rule for Vial to access devices
      vial
    ];

    services.automatic-timezoned.enable = true;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

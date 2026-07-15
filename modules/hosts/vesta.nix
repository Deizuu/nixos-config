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
      tabletDriver

      # Config
      homeManager
      musnix
      nixSettings
      overlays
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

    programs.git.enable = true;
    programs.appimage.enable = true;

    environment.systemPackages = with pkgs; [ # Add Vial to configure keyboard
      vial
      clonehero
      osu-lazer-bin
    ];
    services.udev.packages = with pkgs; [ # Add udev rule for Vial to access devices
      vial
    ];

    boot.kernelPackages = pkgs.linuxPackages_6_6;

    services.automatic-timezoned.enable = true;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

{ self, inputs, ... }: {
  flake.nixosConfigurations.vesta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [
      vesta
      vestaHardware

      pc
    ];
  };

  flake.modules.nixos.vesta = {
    dzu.boot.silentBoot = true;
    dzu.boot.usePlymouth = true;

    dzu.audio = {
      enable = true;
      enableJack = true;
    };

    dzu.hw.nvidiaKepler.enable = true;
    dzu.hw.razer.enable = true;
    dzu.hw.tablet.enable = true;

    dzu.autoTime.enable = true;
    dzu.location.enable = true;

    dzu.login.lightdm.enable = true;
    dzu.de.xfce.enable = true;

    dzu.networking = {
      wifi.enable = true;
      discovery.enable = true;
      i2p.enable = true;
    };

    dzu.printing.enable = true;

    dzu.users.deizu.enable = true;

    dzu.apps = {
      file-roller.enable = true;
      gamemode.enable = true;
      hotspot.enable = true;
      oversteer.enable = true;
      polychromatic.enable = true;
      proton-vpn.enable = true;
      steam.enable = true;
      vial.enable = true;
      vlc.enable = true;
    };

    dzu.appimage.enable = true;
    dzu.flatpak.enable = true;

    musnix.enable = true;
    stylix.enable = true;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

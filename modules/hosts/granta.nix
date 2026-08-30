{ self, inputs, ... }: {
  flake.nixosConfigurations.granta = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [
      granta
      grantaHardware

      pc
    ];
  };

  flake.modules.nixos.granta = {
    dzu.boot.silentBoot = true;
    dzu.boot.usePlymouth = true;

    dzu.audio = {
      enable = true;
      enableChromebook = true;
      enableJack = true;
    };

    dzu.autoTime.enable = true;
    dzu.location.enable = true;

    dzu.hw.tablet.enable = true;

    dzu.login.gdm.enable = true;
    dzu.de.gnome.enable = true;

    dzu.networking = {
      wifi.enable = true;
      discovery.enable = true;
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

    # Disable TPM2 to fix systemd hang
    boot.initrd.systemd.tpm2.enable = false;
    systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

{ config, ... }: {
  nixos.configurations.granta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      grantaHardware

      pc

      chromebookAudioFix
      gdm
      gnome
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

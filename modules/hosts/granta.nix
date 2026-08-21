{ config, ... }: {
  nixos.configurations.granta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      grantaHardware

      pc

      chromebookAudioFix
      gnome
      gdm
    ];

    # Disable TPM2 to fix boot waiting time
    boot.initrd.systemd.tpm2.enable = false;
    systemd.tpm2.enable = false;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

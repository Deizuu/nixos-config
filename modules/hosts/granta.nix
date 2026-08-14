{ config, ... }: {
  nixos.configurations.granta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      grantaHardware

      pc

      chromebookAudioFix
      plasma
    ];
    
    # Disable TPM2 to fix boot waiting time
    boot.initrd.systemd.tpm2.enable = false;
    systemd.tpm2.enable = false;

    stylix.targets.kde.enable = false; # Attempt to fix KDE giving black screen

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

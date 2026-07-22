{ config, ... }: {
  nixos.configurations.granta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      grantaHardware

      pc

      chromebookAudioFix
      gdm
      gnome
    ];
    
    # Disable TPM2 to fix boot waiting time
    boot.initrd.systemd.tpm2.enable = true;
    systemd.tpm2.enable = true;

    networking.hostName = "granta";
    system.stateVersion = "26.05";
  };
}

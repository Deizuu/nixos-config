{ config, ... }: {
  nixos.configurations.vesta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      vestaHardware

      pc

      xfce
      lightdm
      nvidiaKepler
      tmxDrivers
      wol
    ];

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

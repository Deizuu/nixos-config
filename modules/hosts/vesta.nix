{ config, ... }: {
  nixos.configurations.vesta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      vestaHardware

      pc

      cinnamon
      lightdm
      nvidiaKepler
      tmxDrivers
    ];

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

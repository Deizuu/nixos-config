{ config, ... }: {
  nixos.configurations.vesta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      vestaHardware

      pc

      cinnamon
      lightdm
      nvidiaKepler
    ];

    boot.kernelPackages = pkgs.linuxPackages_6_6;

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

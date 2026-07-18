{ config, ... }: {
  nixos.configurations.vesta.module = { pkgs, ... }: {
    imports = with config.nixos.modules; [
      vestaHardware

      pc

      cinnamon
      lightdm
      nvidiaKepler
      tmxDriver
    ];

    boot.kernelPackages = pkgs.linuxPackages_6_6;
    
    # Low res because of stinky VGA cable
    services.xserver.resolutions = [
      { x = 1600; y = 900; }
    ];

    networking.hostName = "vesta";
    system.stateVersion = "26.05";
  };
}

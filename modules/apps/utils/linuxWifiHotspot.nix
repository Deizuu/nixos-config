{
  nixos.modules.pc = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.linux-wifi-hotspot
    ];
  };
}

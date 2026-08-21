{
  nixos.modules.pc = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.proton-vpn
    ];
  };
}

{
  nixos.modules.pc = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      oversteer
    ];
  };
}

{
  nixos.modules.pc = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.file-roller
    ];
  };
}

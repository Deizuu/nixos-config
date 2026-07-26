{
  nixos.modules.pc = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.vlc
    ];
  };
}

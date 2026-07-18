{
  nixos.modules.base = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.python3
    ];
  };
}

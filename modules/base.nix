{ self, ... }: {
  flake.modules.nixos.base = {
    imports = with self.modules.nixos; [
      boot
      home-manager
      networking
    ];
  };
}

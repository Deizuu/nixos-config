{ self, ... }: {
  flake.modules.nixos.pc = {
    imports = with self.modules.nixos; [
      base
    ];
  };
}

{
  nixos.modules = {
    base = {
      boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };

      boot.loader.efi.canTouchEfiVariables = true;
    };

    pc = {
      boot.plymouth.enable = true;
    };
  };
}

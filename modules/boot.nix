{ self, inputs, ... }:
{
  flake.nixosModules.base = {
    boot.loader.grub = {
      enable = true;
      device = "nodev"; # Use EFI partition (automatically detected from /boot mount)
      efiSupport = true;
    };

    boot.loader.efi.canTouchEfiVariables = true;
  };
}

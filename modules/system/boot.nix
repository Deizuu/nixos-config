{ self, inputs, ... }:
{
  flake.nixosModules.bootVesta = { pkgs, ... }: {
    boot.loader.grub = {
      enable = true;
      device = "nodev"; # Use EFI partition (automatically detected from /boot mount)
      efiSupport = true;
    };

    boot.loader.efi.canTouchEfiVariables = true;
  
    boot.kernelPackages = pkgs.linuxPackages_6_6;
  };

  flake.nixosModules.bootGranta = { pkgs, ... }: {
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}

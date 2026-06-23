{ pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev"; # Use EFI partition (automatically detected from /boot mount)
    efiSupport = true;
    useOSProber = true;
  };
  # Note: for non-UEFI systems, change boot.loader to:
  # "device" to your device (example: /dev/sdX ; /dev/nvme0nX)
  # "efiSupport" to false

  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
}

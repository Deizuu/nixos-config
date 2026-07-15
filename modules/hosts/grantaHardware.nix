{ inputs, ... }: {
  flake.nixosModules.grantaHardware = { config, lib, pkgs, modulesPath, ... }: {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/luks-fd7a5fca-0e91-471b-8ff0-78dc2e0120d0";
      fsType = "btrfs";
    };

  boot.initrd.luks.devices."luks-fd7a5fca-0e91-471b-8ff0-78dc2e0120d0".device = "/dev/disk/by-uuid/fd7a5fca-0e91-471b-8ff0-78dc2e0120d0";

  fileSystems."/nix" =
    { device = "/dev/mapper/luks-fd7a5fca-0e91-471b-8ff0-78dc2e0120d0";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/luks-fd7a5fca-0e91-471b-8ff0-78dc2e0120d0";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/530D-DB86";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

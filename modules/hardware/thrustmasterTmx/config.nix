{
  nixos.modules.tmxDrivers = { pkgs, config, ... }: {
    boot.extraModulePackages = [
      (config.boot.kernelPackages.callPackage ./tmx-driver.pkg.nix { })
      (config.boot.kernelPackages.callPackage ./t150_driver.pkg.nix { })
    ];
    boot.kernelModules = [ "tmx_driver" "hid-t150" ];
    boot.blacklistedKernelModules = [ "hid_thrustmaster" ];

    services.xserver.inputClassSections = [
    ''
    Identifier "Thrustmaster TMX"
    MatchProduct "Thrustmaster"
    Option "Calibration" "0 65535 0 65535"
    Option "IgnoreRelativeAxes" "off"
    ''
    ];

    services.udev.extraRules = ''
      # Allow non-root access to the wheel (USB)
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67f", MODE="0666", TAG+="uaccess"

      # Allow non-root access to the wheel (HID device)
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67f", MODE="0666", TAG+="uaccess"

      # Allow non-root access to input events from the wheel
      SUBSYSTEM=="input", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67f", MODE="0666", TAG+="uaccess"
      
      # Allow non-root write access to wheel range/gain sysfs attributes
      SUBSYSTEM=="hid", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67f", MODE="0666", GROUP="input"

      # Set default range and gain when driver attaches (range -> [ 270; 900 ], gain -> [ 0;65535 ])
      SUBSYSTEM=="hid", ATTRS{driver}=="hid-t150", ATTR{range}="900", ATTR{gain}="65535"
    '';
  };
}

{ 
  nixos.modules.tmxDriver = { pkgs, ... }: {
    boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_6.hid-t150 ];
    boot.kernelModules = [ "hid-t150" ];

    services.udev.extraRules = ''
      # Allow non-root access to the wheel
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67e", MODE="0666", TAG+="uaccess"

      # Set default range and gain when driver attaches (range -> [ 270; 900 ], gain -> [ 0;65535 ])
      SUBSYSTEM=="hid", ATTRS{driver}=="hid-t150", ATTR{range}="270", ATTR{gain}="65535"
    '';
  };
}

{ 
  nixos.modules.tmxDriver = { pkgs, ... }: {
    boot.extraModulePackages = [ pkgs.linuxKernel.packages.linux_6_6.hid-t150 ];
    boot.kernelModules = [ "hid-t150" ];

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b67e", MODE="0666", TAG+="uaccess"
    '';
  };
}

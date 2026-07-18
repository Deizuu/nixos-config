{ 
  nixos.modules.tmxDriver = { pkgs, ... }: {
    boot.extraModulePackages = [ pkgs.linuxPackages.hid-t150 ];
    boot.kernelModules = [ "hid-t150" ];

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b68c", MODE="0666", TAG+="uaccess"
    '';
  };
}

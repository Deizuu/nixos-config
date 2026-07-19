# Thrustmaster_TMX_Racing_Wheel
{
  nixos.modules.tmxDrivers = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.linuxConsoleTools ];

    services.udev.extraRules = ''
      ACTION=="add|change", SUBSYSTEM=="input", ATTRS{name}=="*Thrustmaster*TMX*", RUN+="${pkgs.linuxConsoleTools}/bin/evdev-joystick --e $env{DEVNODE} --d 0 --f 0"
    '';
  };
}

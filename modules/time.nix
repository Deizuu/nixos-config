{
  nixos.modules.base = {
    services = {
      ntpd-rs = {
        enable = true;
      };
      automatic-timezoned.enable = true;
    };
  };
}

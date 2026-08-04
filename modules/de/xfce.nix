{
  nixos.modules.xfce = {
    services.xserver.desktopManager.xfce = {
      enable = true;
    };
  };
}

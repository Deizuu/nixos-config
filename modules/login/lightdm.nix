{
  nixos.modules.lightdm = {
    services.xserver.displayManager.lightdm.enable = true;
  };
}

{
  nixos.modules.lightdm = {
    services.xserver.displayManager.lightdm = {
      enable = true;
      greeters.pantheon.enable = true;
    };
  };
}

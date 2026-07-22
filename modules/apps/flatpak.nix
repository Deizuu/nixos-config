{
  nixos.modules.base = {
    services.flatpak.enable = true;
    xdg.portal.enable = true;
  };
}

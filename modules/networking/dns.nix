{
  nixos.modules.base = {
    services.resolved = {
      enable = true;
      # TODO set Mullvad DNS
    };
  };
}

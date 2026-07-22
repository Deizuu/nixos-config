{
  my.user.home.gui = {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
  nixos.modules.base.networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}

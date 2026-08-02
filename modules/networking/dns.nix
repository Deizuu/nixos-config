{
  nixos.modules.base = {
    networking = {
      networkmanager.dns = "none";
      useDHCP = false;
      dhcpcd.enable = false;

      nameservers = [
        "194.242.2.2" # dns.mullvad.net
        #"194.242.2.6" # family.dns.mullvad.net
        "9.9.9.9" # Quad9 DNS (fallback)
        "1.1.1.1" # Cloudflare DNS (most fallbackest of the fallback)
      ];
    };
    services.resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNSSEC = true;
          DNSOverTLS = true;
          LLMNR = true;
          MulticastDNS = "resolve";
        };
      };
    };
  };
}

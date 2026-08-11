{
  nixos.modules.base = {
    networking = {
      nameservers = [
        "127.0.0.1"
        "::1"
      ];
      dhcpcd.extraConfig = "nohook resolv.conf";
      networkmanager.dns = "none";
    };
  };
}
# "194.242.2.6" # family.dns.mullvad.net
# "9.9.9.9" # Quad9 DNS (fallback)
# "1.1.1.1" # Cloudflare DNS (most fallbackest of the fallback)

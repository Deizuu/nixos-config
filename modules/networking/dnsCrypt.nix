{
  nixos.modules.base =
    let
      hasIPv6Internet = true;
      StateDirectory = "dnscrypt-proxy";
    in
    {
      services.dnscrypt-proxy = {
        enable = true;
        settings = {
          sources.public-resolvers = {
            urls = [
              "https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md"
              "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
            ];
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
            cache_file = "/var/lib/${StateDirectory}/public-resolvers.md";
          };

          ipv6_servers = hasIPv6Internet;
          block_ipv6 = !(hasIPv6Internet);

          require_dnssec = true;
          require_nolog = true;
          require_nofilter = true;

          server_names = [
            "mullvad-family-doh-ipv6"
            "mullvad-family-doh"
            
            "quad9-dnscrypt-ip6-filter-ecs-pri"
            "quad9-dnscrypt-ip4-filter-ecs-pri"

            "nextdns-ipv6"
            "nextdns"

            "cloudflare-family-ipv6"
            "cloudflare-family"

            "cloudflare"
          ];
        };
      };
      systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = StateDirectory;
    };
}

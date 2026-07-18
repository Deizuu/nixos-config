{
  nixos.modules.base = {
    systemd.network.networks."10-no-dhcp-dns" = {
      matchConfig = {
        Name = "eno2";
      };

      dhcpV4Config.UseDNS = false;
      ipv6AcceptRAConfig.UseDNS = false;

      # do you use dhcpv6?
      # dhcpV6Config.UseDNS = false;

      # copy-pasted from https://github.com/NixOS/nixpkgs/blob/140e28cf6e76915d9440e06facdb5e1e4f70a342/nixos/modules/tasks/network-interfaces-systemd.nix#L61-L68
      DHCP = "yes";
      networkConfig.IPv6PrivacyExtensions = "kernel";
    };
    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNSOverTls = "opportunistic";
	DNS = [
          "194.242.2.6"#family.dns.mullvad.net
	];
      };
    };
  };
}

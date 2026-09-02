{
  flake.modules.nixos.base = { config, ... }: {
    config = {
      networking = {
        nameservers = [
          "127.0.0.1"
          "::1"
        ];
        dhcpcd.extraConfig = "nohook resolv.conf";
        networkmanager.dns = "none";
      };
    };
  };
}

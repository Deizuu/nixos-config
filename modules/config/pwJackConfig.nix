{
  flake.nixosModules.pwJackConfig = { pkgs, ... }: {
    services.pipewire.extraConfig.jack = {
      "99-low-latency" = {
        "jack.properties" = {
          "node.latency" = "256/48000";
        };
      };
    };
  };
}

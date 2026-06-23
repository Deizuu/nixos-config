{ ... }:
{
  services.pipewire.jackConfigs = {
    "99-latency" = {
      "jack.properties" = {
        "node.latency" = 256/48000;
      };
    };
  };
}

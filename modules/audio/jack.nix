{
  flake.modules.nixos.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.audio;
    in
    {
      options.dzu.audio = {
        enableJack = lib.mkEnableOption "Enable PipeWire JACK";
      };
      config = lib.mkIf cfg.enableJack {
        services.pipewire.jack.enable = true;
        services.pipewire.extraConfig.jack = {
          "99-low-latency"."jack.properties"."node.latency" = "256/48000";
        };
      };
    };
}

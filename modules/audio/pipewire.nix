{
  flake.modules.nixos.base =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.audio;
    in
    {
      options.dzu.audio = {
        enable = lib.mkEnableOption "Enable PipeWire audio";
        haveUtils = lib.mkEnableOption "Have audio utilities";
      };
      config = lib.mkIf cfg.enable {
        security.rtkit.enable = true;
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        environment.systemPackages = lib.mkIf cfg.haveUtils (
          with pkgs;
          [
            pwvucontrol
            qpwgraph
          ]
        );
      };
    };
}

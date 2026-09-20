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
      };
      config = lib.mkIf cfg.enable {
        security.rtkit.enable = true;
        services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        environment.systemPackages = with pkgs; [
          pwvucontrol
          qpwgraph
        ];
      };
    };
}

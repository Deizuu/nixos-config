{
  flake.nixosModules.proAudio = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      ardour
      carla
      neural-amp-modeler-lv2
      guitarix
      calf
      lsp-plugins
    ];
}

{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      ardour
      carla
      neural-amp-modeler-lv2
      guitarix
      calf
      lsp-plugins
    ];
  };
}

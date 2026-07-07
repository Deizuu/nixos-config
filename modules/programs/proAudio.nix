{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      ardour
      calf
      carla
      guitarix
      helvum
      lsp-plugins
      neural-amp-modeler-lv2
    ];
  };
}

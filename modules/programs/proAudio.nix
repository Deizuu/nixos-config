{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      ardour # DAW
      calf # Plugin pack
      carla # Plugin host
      guitarix # Plugin host & pack
      helvum # Patchbay
      lsp-plugins # Plugin pack
      neural-amp-modeler-lv2 # Plugin
      vocproc # Plugin
    ];
  };
}

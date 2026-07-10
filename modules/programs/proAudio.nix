{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      ardour # DAW
      audacity # The Almighty Audacity
      calf # Plugin pack
      carla # Plugin host
      guitarix # Plugin host & pack
      helvum # Patchbay
      lsp-plugins # Plugin pack
      ratatouille-lv2 # Plugin
      vocproc # Plugin
    ];
  };
}

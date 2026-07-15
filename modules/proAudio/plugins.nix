{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      calf
      guitarix
      lsp-plugins
      ratatouille-lv2
      vocproc
    ];
  };
}

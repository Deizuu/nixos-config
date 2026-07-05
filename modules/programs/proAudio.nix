{
  flake.nixosModules.proAudio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      ardour
      carla
      neural-amp-modeler-lv2
      guitarix
      calf
      lsp-plugins
    ];
  };
}

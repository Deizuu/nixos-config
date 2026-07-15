{
  flake.homeModules.proAudio = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      ardour # DAW
      audacity # DAW
      carla # Plugin host
      helvum # Patchbay
    ];
  };
}

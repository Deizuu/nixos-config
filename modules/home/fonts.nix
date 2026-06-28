{
  flake.homeModules.fonts = { pkgs, ... }: {
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}

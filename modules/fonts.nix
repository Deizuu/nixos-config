{
  flake.homeModules.fonts = { pkgs, ... }: {
    home.packages = with pkgs.nerd-fonts; [
      jetbrains-mono
    ];
  };
}

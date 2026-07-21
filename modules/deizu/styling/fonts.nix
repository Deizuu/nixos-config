{
  my.user.home.gui = { pkgs, ... }: {
    stylix.fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono";
      };
      sansSerif = {
        package = pkgs.vegur;
        name = "Vegur";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}

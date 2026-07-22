{
  my.user.home.gui = { pkgs, ... }: {
    home.pointerCursor.enable = true;
    stylix.cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}

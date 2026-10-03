{
  flake.modules.homeManager.gui = {
    gtk.enable = true;
    qt.enable = true;

    stylix.targets.qt.platform = "qtct";
  };
}

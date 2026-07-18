{
  my.user.home.gui = { pkgs, ... }: {
    home.packages = with pkgs; [
      ardour
      audacity
      carla
    ];
  };
}

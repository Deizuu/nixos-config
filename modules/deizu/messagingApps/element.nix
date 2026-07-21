{
  my.user.home.gui = { pkgs, ... }: {
    home.packages = with pkgs; [
      element-desktop
    ];
  };
}

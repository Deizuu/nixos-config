{
  my.user.home.gui = { pkgs, ... }: {
    home.packages = [
      pkgs.kdePackages.kdenlive
    ];
  };
}

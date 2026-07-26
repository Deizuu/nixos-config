{
  my.user.home.gui = { pkgs, ... }: {
    home.packages = [
      pkgs.ente-web
    ];
  };
}

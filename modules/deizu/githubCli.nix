{
  my.user.home.base = { pkgs, ... }: {
    home.packages = [
      pkgs.github-cli
    ];
  };
}

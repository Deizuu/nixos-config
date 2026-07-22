{
  my.user.home.base = { pkgs, ... }: {
    home.packages = [
      pkgs.bitwarden-cli
    ];
  };
}

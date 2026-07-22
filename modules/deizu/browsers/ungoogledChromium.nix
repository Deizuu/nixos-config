{
  my.user.home.gui = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}

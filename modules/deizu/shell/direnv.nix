{
  my.user.home.base = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      #config.global.warn_timeout = 0;
    };
  };
}

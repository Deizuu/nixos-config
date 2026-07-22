{
  my.user.home.base = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Deizuu";
          email = "120480615+Deizuu@users.noreply.github.com";
        };
        init.defaultBranch = "master";
        push.default = "current";
        pull.rebase = true;
        commit.verbose = true;
      };
    };
  };
}

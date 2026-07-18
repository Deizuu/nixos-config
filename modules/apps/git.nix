{
  my.user.home.base = {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "master";
	push.default = "current";
	commit.verbose = true;
      };
    };
  };
}

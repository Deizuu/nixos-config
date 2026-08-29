{
  flake.modules.hm.gui = {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "master";
        push.default = "current";
        pull.rebase = true;
        commit.verbose = true;
      };
    };
  };
}

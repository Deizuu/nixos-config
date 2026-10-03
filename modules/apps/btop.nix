{
  flake.modules.homeManager.gui = {
    programs.btop = {
      enable = true;
      settings = {
        vim_mode = true;
      };
    };
  };
}

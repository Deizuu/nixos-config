{
  flake.modules.hm.gui = {
    programs.btop = {
      enable = true;
      settings = {
        vim_mode = true;
      };
    };
  };
}

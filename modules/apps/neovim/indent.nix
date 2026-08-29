{
  flake.modules.hm.base = {
    programs.nvf.settings.vim = {
      options.autoindent = true;
      options.tabstop = 2;
      options.shiftwidth = 2;
    };
  };
}

{
  flake.modules.hm.base = {
    programs.nvf.settings.vim.clipboard = {
      enable = true;
      providers.xclip.enable = true;
    };
  };
}

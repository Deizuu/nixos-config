{ inputs, ... }: {
  my.user.home.base = { pkgs, ... }: {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];
    programs.nvf = {
      enable = true;
      defaultEditor = true;
      settings = {
        vim.viAlias = true;
	vim.vimAlias = true;
	vim.lsp = {
	  enable = true;
        };
      };
    };
  };
}

{ inputs, ... }: {
  my.user.home.base = { pkgs, ... }: {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];
    programs.nvf = {
      enable = true;
      defaultEditor = true;
      settings.vim = {
        viAlias = true;
        vimAlias = true;
        lsp = {
	        enable = true;
        };
      };
    };
  };
}

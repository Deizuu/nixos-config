{
  my.user.home.base = { pkgs, ... }: {
    home.packages = with pkgs; [
      tree-sitter
    ];
    programs.nvf.settings.vim = {
      treesitter.enable = true;
    };
  };
}

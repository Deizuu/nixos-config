{
  my.user.home.base = { pkgs, ... }: {
    home.packages = [ pkgs.tree-sitter ];
    programs.nvf.settings.vim = {
      languages = {
        enableFormat = true;
        enableTreesitter = true;

        nix.enable = true;
        python.enable = true;
        html.enable = true;
        css.enable = true;
        typescript.enable = true;
      };
    };
  };
}

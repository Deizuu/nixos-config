{
  my.user.home.base = { pkgs, ... }: {
    # TODO use Nixvim for configuring Neovim
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        LazyVim
      ];
    };
  };
}

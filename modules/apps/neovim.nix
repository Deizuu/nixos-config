{
  flake.homeModules.neovim = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        LazyVim
      ];
    };
  };
}

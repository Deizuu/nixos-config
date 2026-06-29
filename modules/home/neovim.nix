{
  flake.homeModules.neovim = { pkgs, ... }: {
    programs.neovim.plugins = with pkgs.vimPlugins; [
        LazyVim
    ];
  };
}

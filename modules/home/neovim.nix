{
  flake.homeModules.neovim = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        LazyVim
      ];
    };
  };
}

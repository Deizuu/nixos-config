{
  flake.homeModules.btop = { pkgs, ... }: {
    programs.btop = {
      enable = true;
      settings = {
	    color_theme = "gruvbox_dark_v2";
        vim_mode = true;
      };
    };
  };
}

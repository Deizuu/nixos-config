{
  flake.homeModules.alacritty = { pkgs, ... }: {
    programs.alacritty = {
	  enable = true;
	  settings = { }; # insert here future config

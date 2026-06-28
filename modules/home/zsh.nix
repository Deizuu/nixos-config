{
  flake.homeManager.zsh = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "";
        plugins = [
          "git"
	  "zsh-syntax-highlighting"
	  "zsh-autosuggestions"
        ];
      };
    };
  };
}

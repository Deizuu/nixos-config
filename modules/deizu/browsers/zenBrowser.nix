{ inputs, ... }: {
  flake-file.inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
  };

  my.user.home.gui =
  {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      profiles."w44kf3ur.Default (release)" = {
        search = {
	  force = true;
	  default = "ddg";
	};
	settings = {
	  "browser.theme.toolbar-theme" = 0;
	  "browser.theme.content-theme" = 0;
	  "layout.css.prefers-color-scheme.content-override" = 0;
	  "browser.theme.dark-private-window" = true;

	  "zen.welcome-screen.seen" = true;
	};
      };
    };
  };
}

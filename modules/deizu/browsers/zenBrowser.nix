{ inputs, ... }: {
  flake-file.inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
  };

  my.user.home.gui =
  let
    zenProfile = "Default User";
  in
  {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      profiles."Default User" = {
        search = {
	  force = true;
	  default = "ddg";
	};
      };
    };

    stylix.targets.zen-browser = {
      profileNames = [ "Default User" ];
    };
    stylix.targets.zen-browser.profileNames = [ "Default" ];
  };
}

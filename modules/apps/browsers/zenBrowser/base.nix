{ inputs, ... }: {
  flake-file.inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
  };

  flake.modules.homeManager.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.zen-browser;
    in
    {
      imports = [ inputs.zen-browser.homeModules.beta ];

      options.dzu.apps.zen-browser = {
        enable = lib.mkEnableOption "Enable Zen Browser";
      };
      config = {
        programs.zen-browser = lib.mkIf cfg.enable {
          enable = true;
          setAsDefaultBrowser = true;
        };
        stylix.targets.zen-browser.profileNames = [ "Default" ];
      };
    };
}

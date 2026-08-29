{ inputs, ... }: {
  flake-file.inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.followd = "home-manager";
    };
  };
  flake.modules.hm.gui =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.zen-browser;
    in
    {
      options.dzu.apps.zen-browser = {
        enable = lib.mkEnableOption "Enable Zen Browser";
      };
      config = {
        imports = [ inputs.zen-browser.homeModules.beta ];

        programs.zen-browser = lib.mkIf cfg.enable {
          enable = true;
          setAsDefaultBrowser = true;
        };
      };
    };
}

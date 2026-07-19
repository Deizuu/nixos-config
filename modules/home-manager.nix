{ inputs, lib, ... }: {
  options.homeManager = {
    modules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };
  };

  config = {
    flake-file.inputs.home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homeManager.modules.base = { osConfig, ... }: {
      home.stateVersion = osConfig.system.stateVersion;
    };

    nixos.modules.base = {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        backupFileExtension = ".backup";
	overwriteBackup = true;
	useGlobalPkgs = true;
	useUserPackages = true;
      };
    };
  };
}

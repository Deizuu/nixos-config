{ inputs, lib, ... }: {
  options.homeManager = {
    modules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };
  };

  config = {
    flake-file.inputs.home-manager = {
      url = "github:nix-community/home-manager";
      flake = false;
    };

    _module.args.homeManager = import "${inputs.home-manager}/lib" {inherit lib;};
    
    homeManager.modules.base = { osConfig, ... }: {
      home.stateVersion = osConfig.system.stateVersion;
    };

    nixos.modules.base = {
      imports = [ "${inputs.home-manager}/nixos" ];

      home-manager = {
        backupFileExtension = ".backup";
	overwriteBackup = true;
	useGlobalPkgs = true;
	useUserPackages = true;
      };
    };
  };
}

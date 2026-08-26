{ inputs, ... }: {
  flake-file.inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.base = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
      backupFileExtension = ".backup";
      overwriteBackup = true;
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

  flake.modules.hm.base = { osConfig, ... }: {
    home.stateVersion = osConfig.system.stateVersion;
  };
}

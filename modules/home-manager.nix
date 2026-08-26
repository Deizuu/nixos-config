{
  flake-file.inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.home-manager =
    {
      config,
      lib,
      inputs,
      ...
    }:
    let
      cfg = config.dzu.home-manager;
    in
    {
      options.dzu.home-manager = {
        enable = lib.mkEnableOption "Enable home-manager";
      };
      config = lib.mkIf cfg.enable {
        imports = [ inputs.home-manager.nixosModules.home-manager ];
        home-manager = {
          backupFileExtension = ".backup";
          overwriteBackup = true;
          useGlobalPkgs = true;
          useUserPackages = true;
        };
      };
    };

  flake.modules.hm.base = { osConfig, ... }: {
    home.stateVersion = osConfig.system.stateVersion;
  };
}

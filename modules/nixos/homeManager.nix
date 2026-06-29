{ self, inputs, ... }: {
  # Importing and configuring home-manager
  flake.nixosModules.homeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default # Import official home-manager NixOS module
    ];
    
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}

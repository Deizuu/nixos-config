{ self, inputs, ... }: {
  # Importing and configuring home-manager
  flake.modules.nixos.base = {
    imports = [
      inputs.home-manager.nixosModules.default # Import official home-manager NixOS module
    ];
    
    home-manager = {
      backupFileExtension = ".backup";
      overwriteBackup = true;
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}

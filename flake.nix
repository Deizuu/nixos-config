{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          (./hosts/default/configuration.nix)
		  (./hosts/default/hardware-configuration.nix)

		  (./hosts/default/userDefaults.nix)
		  (./hosts/default/systemDefaults.nix)

		  # Import override from external path if it exists
		  (if builtins.pathExists "/etc/nixos/private/userOverrides.nix" then
		    "/etc/nixos/private/userOverrides.nix"
			else { })
		  (if builtins.pathExists "/etc/nixos/private/systemOverrides.nix" then
		    "/etc/nixos/private/systemOverrides.nix"
			else { })

          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}

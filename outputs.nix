inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree.filterNot (inputs.nixpkgs.lib.hasSuffix "pkg.nix") ./modules)

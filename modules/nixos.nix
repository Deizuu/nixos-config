{ config, lib, ... }: {
  options.nixos = {
    modules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };

    configurations = lib.mkOption {
      type = lib.types.lazyAttrsOf (
        lib.types.submodule {
	  options.module = lib.mkOption {
	    type = lib.types.deferredModule;
	  };
	}
      );
    };
  };

  config.flake = {
    nixosConfigurations = config.nixos.configurations
      |> lib.mapAttrs ( name: { module }: lib.nixosSystem {modules = [ module ]; }
    );

    checks =
      config.flake.nixosConfigurations
      |> lib.mapAttrsToList (
        name: nixos: {
          ${nixos.config.nixpkgs.hostPlatform.system} = {
            "configurations:nixos:${name}" = nixos.config.system.build.toplevel;
          };
        }
      )
      |> lib.mkMerge;
  };
}

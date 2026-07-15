{ self, inputs, ... }: {
  flake.nixosModules.overlays = { pkgs, ... }: {
    nixpkgs.overlays = [
      (_final: prev: {
        vulkan-validation-layers = prev.vulkan-validation-layers.overrideAttrs (old: {
          cmakeFlags = old.cmakeFlags or [] ++ [
            "-DUPDATE_DEPS=false"
          ];
          buildInputs = old.buildInputs or [] ++ [
            prev.spirv-tools
          ];
        });
      })
    ];
  };
}

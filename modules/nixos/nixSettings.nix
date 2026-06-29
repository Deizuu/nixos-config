{ self, inputs, ... }: {
  flake.nixosModules.nixSettings = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
  };
}

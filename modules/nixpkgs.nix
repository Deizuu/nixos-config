{ inputs, ... }: {
  flake-file.inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  perSystem = psArgs @ {
    system,
    pkgs,
    ...
  }: {
    imports = ["${inputs.nixpkgs}/nixos/modules/misc/nixpkgs.nix"];
    nixpkgs.hostPlatform = {inherit system;};
    _module.args = psArgs.config.nixpkgs.pkgs;
    legacyPackages = pkgs;
  };
}

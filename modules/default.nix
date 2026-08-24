{ inputs, ... }:
{

  imports = [
    inputs.flake-file.flakeModules.default
    inputs.flake-parts.flakeModules.modules
  ];

  systems = inputs.nixpkgs.lib.systems.flakeExposed;

  flake-file.inputs = {
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
  };

}

{ inputs, ... }: {
  imports = [
    # Add home-manager options to flake-parts
    inputs.home-manager.flakeModules.home-manager
  ];

  config.systems = [
    "x86_64-linux"
  ];
}

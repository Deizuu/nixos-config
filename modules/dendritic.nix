{ inputs, ... }:
{
  imports = [
    inputs.flake-file.flakeModules.dendritic
  ];

  flake-file.outputs = "default";
}

{
  flake-file.nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];
  };

  nixos.modules.base = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

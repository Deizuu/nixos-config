{
  flake.modules.nixos.base = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

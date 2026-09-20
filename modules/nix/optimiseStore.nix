{
  flake.modules.nixos.base = {
    nix.settings.auto-optimise-store = true;
  };
}

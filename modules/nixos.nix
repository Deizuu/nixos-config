{ lib, ... }: {
  options.flake.modules.nixos = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.submodule;
  };
}

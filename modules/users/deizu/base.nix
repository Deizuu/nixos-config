{
  flake.modules.nixos.users = {
    dzu.users.deizu = {
      name = "deizu";
      description = "Deizu";
      extraGroups = [ "wheel" ];
    };
  };
}

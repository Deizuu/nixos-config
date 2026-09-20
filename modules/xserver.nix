{
  flake.modules.nixos.base = { pkgs, ... }: {
    services.xserver.enable = true;

    environment.systemPackages = with pkgs; [
      xclip
    ];
  };
}

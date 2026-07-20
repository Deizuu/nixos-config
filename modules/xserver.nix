{
  nixos.modules.pc = { pkgs, ... }: {
    services.xserver.enable = true;
    
    environment.systemPackages = with pkgs; [
      xclip
    ];
  };
}

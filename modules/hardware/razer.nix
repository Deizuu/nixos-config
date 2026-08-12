{
  nixos.modules.base = { pkgs, ... }: {
    hardware.openrazer = {
      enable = true;
    };

    # Wiki says to add this, but hardware.openrazer.enable should be enough

    # environment.systemPackages = with pkgs; [
    #   openrazer-daemon
    # ];
  };

  my.user.extraGroups = [ "openrazer" ];
}

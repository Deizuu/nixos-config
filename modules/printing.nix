{
  nixos.modules.pc = { pkgs, ... }: {
    services.printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        hplip
        splix
      ];
    };

  };
  my.user.extraGroups = [ "lpadmin" ];
}

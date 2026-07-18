{ config, ... }: {
  nixos.modules.pc = { pkgs, ... }: {
    services.printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
	hplip
	splix
      ];
    };

    users.users.${config.my.user.name}.extraGroups = [ "lpadmin" ];
  };
}

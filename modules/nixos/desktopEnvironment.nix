{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    services.xserver.enable = true;

	services.displayManager.gdm.enable = true;
	services.xserver.desktopManager.cinnamon.enable = true;

	services.xserver.xkb = {
      layout = "us";
	  variant = "colemak_dh_ortho";
	  options = "grp:alt_shift_toggle";
	};
  };
}

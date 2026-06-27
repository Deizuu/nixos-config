{ ... }:
{
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.xserver.xkb = {
    layout = "fr,us";
    variant = "us,colemak_dh_ortho";
	options = "grp:alt_shift_toggle";
  };
}

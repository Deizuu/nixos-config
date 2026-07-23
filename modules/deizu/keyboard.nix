{
  my.user.home.base = { pkgs, lib, ... }: {
    home.keyboard = {
      layout = "us";
      variant = "colemak_dh_ortho";
      options = [ "grp:alt_shift_toggle" ];
    };
  };
}

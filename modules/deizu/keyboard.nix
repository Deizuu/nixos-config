{
  my.user.home.base = { pkgs, lib, ... }: {
    home.keyboard = {
      layout = "us,fr";
      variant = "colemak_dh_ortho_,us";
      options = [ "grp:alt_shift_toggle" ];
    };

    dconf.settings = {
      "org/kde/kcmm/keyboards/general" = {
        layout = "us,fr";
        variants = "colemak_dh_ortho_,us";
        options = "grp:alt_shift_toggle";
        model = "";
      };
    };
  };
}

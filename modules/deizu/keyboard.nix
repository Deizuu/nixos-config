{
  my.user.home.base = { pkgs, lib, ... }: {
    home.keyboard = {
      layout = "us,fr";
      variant = "colemak_dh_ortho_,us";
      options = [ "grp:alt_shift_toggle" ];
    };

    dconf.settings = {
      "org/cinnamon/desktop/input-sources" = {
        sources = [
          (lib.hm.gvariant.mkTuple [ "xkb" "us+colemak_dh_ortho" ])
          (lib.hm.gvariant.mkTuple [ "xkb" "fr" ])
        ];
        xkb-options = ["grp:alt_shift_toggle"];
      };
    };
  };
}

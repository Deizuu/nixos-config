{ self, inputs, ... }: {
  flake.nixosModules.desktopGnome = { pkgs, ... }: {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "colemak_dh_ortho";
      options = "grp:alt_shift_toggle";
    };

    environment.systemPackages = with pkgs; [
      pkgs.qt5.qtwayland
    ];
  };
}

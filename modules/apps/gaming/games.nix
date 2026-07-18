{
  allowUnfreePackages = [
    "clonehero"
    "osu-lazer-bin"
  ];
  my.user.home.gui = { pkgs, ... }: {
    home.packages = with pkgs; [
      clonehero
      osu-lazer-bin
    ];
  };
}

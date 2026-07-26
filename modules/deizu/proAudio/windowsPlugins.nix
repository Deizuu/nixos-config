{
  my.user.home.base = { pkgs, ... }: {
    home.packages = with pkgs; [
      yabridge
      yabridgectl

      wineWow64Packages.staging
    ];
  };
}

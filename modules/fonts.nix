{
  homeManager.modules.gui = { pkgs, ... }: {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans

      noto-fonts-color-emoji
      gucharmap
      uni
    ];
  };
}

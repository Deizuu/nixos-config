{
  homeManager.modules.gui = { pkgs, ... }: {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      gucharmap
      nerd-fonts.jetbrains-mono
      uni
    ];
  };
}

{
  my.user.home.gui = { pkgs, ... }: {
    home.packages = with pkgs; [
      calf
      guitarix
      lsp-plugins
      ratatouille-lv2
      neural-amp-modeler-lv2
    ];
  };
}

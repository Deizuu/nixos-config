{
  my.user.home.gui = { pkgs, ... }:
  let
    namLv2 = pkgs.callPackage ./namLv2.pkg.nix {};
  in
  {
    home.packages = [
      pkgs.calf
      pkgs.guitarix
      pkgs.lsp-plugins
      pkgs.ratatouille-lv2
      namLv2
    ];
  };
}

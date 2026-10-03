{ inputs, ... }: {
  flake-file.inputs.nvf = {
    url = "github:notashelf/nvf";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.homeManager.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.apps.neovim;
    in
    {
      imports = [ inputs.nvf.homeManagerModules.default ];
      options.dzu.apps.neovim = {
        enable = lib.mkEnableOption "Enable Neovim";
        defaultEditor = lib.mkEnableOption "Make Neovim the default editor for the user";
      };
      config = {

        programs.nvf = {
          enable = lib.mkIf cfg.enable true;
          defaultEditor = lib.mkIf cfg.defaultEditor true;
          settings.vim = {
            viAlias = true;
            vimAlias = true;
            lsp.enable = true;
          };
        };
      };
    };
}

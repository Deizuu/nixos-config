{ inputs, ... }: {
  flake-file.inputs.stylix = {
    url = "github:nix-community/stylix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.pc =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];

      stylix = {
        enable = lib.mkDefault false;
        base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        image = pkgs.fetchurl {
          url = "https://getwallpapers.com/wallpaper/full/f/b/3/6032.jpg"; # TODO change wallpaper, this is a temp
          hash = "sha256-NdtooA+oODFnEdUeEwxlErVnFICt8JSzc9IMa8xLFxI=";
        };
        polarity = lib.mkDefault "dark";
      };
    };
}

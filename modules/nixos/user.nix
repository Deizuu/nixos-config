{ self, inputs, ... }: {
  flake.nixosModules.user = { config, lib, pkgs, ... }:
    let
      cfg = config.my.user;
    in
    {
      options.my.user = {
        enable = lib.mkEnableOption "Enable user";

	name = lib.mkOption {
          type = lib.types.str;
	  default = "deizu";
	  description = "User name";
        };

	description = lib.mkOption {
	  type = lib.types.str;
	  default = "Deizu";
	  description = "User description (usually full name)";
        };

	extraGroups = lib.mkOption {
          type = lib.types.listOf lib.types.str;
	  default = [ "networkmanager" "wheel" "audio" "video" ];
	  description = "Extra groups for the user";
        };

	shell = lib.mkOption {
          type = lib.types.either lib.types.path lib.types.package;
	  default = pkgs.zsh;
	  description = "Default shell for the user";
        };
      };

      config = lib.mkIf cfg.enable {
        users.users.${cfg.name} = {
          isNormalUser = true;
	  inherit (cfg) description extraGroups shell;
        };
        home-manager.users.${cfg.name} = self.homeConfigurations.user;
      };
    };
}

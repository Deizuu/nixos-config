{lib, config, pkgs, ...}:
let
  cfg = config.myUser;
in
{
  options.myUser = {
    username = lib.mkOption {
	  type = lib.types.str;
	  default = "johnd";
	  description = "The user's name";
	};

	userDescription = lib.mkOption {
	  type = lib.types.str;
	  default = "John Doe";
	  description = "The user's description (usually the full name of the user)";
	};

	hashedPassword = lib.mkOption {
	  type = lib.types.nullOr lib.types.str;
	  default = null;
	};
  };

  config = {
    users.users.${cfg.username} = {
	  isNormalUser = true;
	  description = cfg.userDescription;
	  initialHashedPassword = cfg.hashedPassword;
	  extraGroups = [ "networkmanager" "wheel" ];
	};
  };
}

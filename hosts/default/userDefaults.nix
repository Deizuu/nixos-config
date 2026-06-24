{lib, config, pkgs, ...}:
let
  cfg = config.myUser;
in
{
  options.myProfile = {
    username = lib.mkOption {
	  type = lib.types.str;
	  default = "johnd";
	  description = "The user's name";
	};

	userDescription = {
	  type = lib.types.str;
	  default = "John Doe";
	  description = "The user's description (usually the full name of the user)";
	};

	hashedPassword = {
	  type = lib.types.nullOr lib.types.str;
	  default = null;
	};
  };

  config = {
    users.users.${cfg.username} = {
	  isNormalUser = true;
	  userDescription = cfg.userDescription;
	  initialHashedPassword = cfg.hashedPassword;
	  extraGroups = [ "networkmanager" "wheel" ];
	};
  };
}

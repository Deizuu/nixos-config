{ lib, config, pkgs, ...}:
let
  cfg = config.mySystem;
in
{
  options.mySystem = {
    hostName = lib.mkOption {
	  type = lib.types.str;
	  default = "nixos";
	};

	timeZone = lib.mkOption {
	  type = lib.types.str;
	  default = "UTC";
	};
  };

  config = {
    networking.hostName = cfg.hostName;
    time.timeZone = cfg.timeZone;
  };
}

{ lib, config, pkgs, ...}:
let
  cfg = config.mySystem;
in
{
  options.mySystem = {
    hostName = {
	  type = lib.types.str;
	  default = "nixos";
	};

	timeZone = {
	  type = lib.types.str;
	  default = "UTC";
	};
  };

  config = {
    networking.hostName = cfg.hostname;
    time.timeZone = cfg.timeZone;
  };
}

{ config, pkgs, ... }: {
	# Enable X server with NVIDIA driver (Kepler pretty much only supports X11)
	services.xserver.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	# NVIDIA driver configuration
	hardware.nvidia = {
		package = config.boot.kernelPackages.nvidia_x11;
		modesetting.enable = true;
		powerManagement.enable = true;
		open = false; # Use proprietary driver for better support on older cards
	};

	boot.kernelModules = [ "nvidia" ];
}

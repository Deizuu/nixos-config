{ self, inputs, ... }: {
  flake.nixosModules.nvidiaKepler = { config, pkgs, ... }: {
	# Enable X server with NVIDIA driver (Kepler pretty much only supports X11)
	services.xserver.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];

	# NVIDIA driver configuration
	hardware.nvidia = {
	  enabled = true;
	  package = pkgs.linuxKernel.packages.linux_6_6.nvidia_x11_legacy470;
	  modesetting.enable = true;
	  powerManagement.enable = true;
	  open = false; # Use proprietary driver for better support on older cards
	};

	boot.kernelModules = [ "nvidia" ];
	boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  };
}

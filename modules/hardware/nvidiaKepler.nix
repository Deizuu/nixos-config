{
  nixos.modules.nvidiaKepler = { pkgs, lib, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      package = pkgs.linuxKernel.packages.nvidia_x11_legacy470;
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
    };

    environment.systemPackages = with pkgs; [
      nvtopPackages.nvidia
      
      dxvk
      dxvk_2
      libva
      vulkan-loader
      vulkan-tools
    ];

    boot.kernelModules = [ "nvidia" ];
    boot.kernelParams = [ "nvidia-drm.modeset=1" ];

    nixpkgs.config.nvidia.acceptLicense = true;
  };

  allowUnfreePackages = [
    "nvidia-x11"
    "cuda_nvml_dev"
    "nvidia-settings"
    "nvidia-kernel-modules"
  ];
}

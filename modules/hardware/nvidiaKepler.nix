{
  nixos.modules.nvidiaKepler = { pkgs, lib, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      package = pkgs.linuxKernel.packages.linux_6_6.nvidia_x11_legacy470;
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
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11" "cuda_nvml_dev"
    ];
  };
}

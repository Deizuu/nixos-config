{
  flake.modules.nixos.base =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      cfg = config.dzu.hw.nvidiaKepler;
    in
    {
      options.dzu.hw.nvidiaKepler = {
        enable = lib.mkEnableOption "Enable NVIDIA Kepler drivers";
      };

      config = lib.mkIf cfg.enable {
        services.xserver.videoDrivers = [ "nvidia" ];

        hardware.nvidia = {
          package = pkgs.linuxPackages.nvidia_x11_legacy470;
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
    };
}

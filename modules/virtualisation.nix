{
  flake.modules.nixos.base =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.dzu.vm;
    in
    {
      options.dzu.vm = {
        enable = lib.mkEnableOption "Enable VM utilities";
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          pkgs.qemu
        ];
        virtualisation.libvirtd.enable = true;
        programs.virt-manager.enable = true;
        programs.dconf.enable = true; # virt-manager allegedly requires dconf
        dzu.users.deizu.extraGroups = [ "libvirtd" ];
      };
    };
}

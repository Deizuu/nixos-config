{ self, inputs, ... }:
{
  flake.homeModules.pluginLink = { config, pkgs, ... }: {
    home.file.".ladspa/link-to-store".source = "/etc/profiles/per-user/${config.my.user.name}/lib/ladspa";
    home.file.".lv2/link-to-store".source = "/etc/profiles/per-user/${config.my.user.name}/lib/lv2";
    home.file.".vst/link-to-store".source = "/etc/profiles/per-user/${config.my.user.name}/lib/vst";
    home.file.".vst3/link-to-store".source = "/etc/profiles/per-user/${config.my.user.name}/lib/vst3";
  };
}

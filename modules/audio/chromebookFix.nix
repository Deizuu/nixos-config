{
  nixos.modules.chromebookAudioFix = { config, lib, pkgs, ... }:
  let
    alsa-ucm-conf-cros = pkgs.fetchFromGitHub {
      owner = "WeirdTreeThing";
      repo = "alsa-ucm-conf-cros";
      rev = "a4e92135fd49e669b5ce096439289e05e25ae90c";
      hash = "sha256-3TpzjmWuOn8+eIdj0BUQk2TeAU7BzPBi3FxAmZ3zkN8=";
    };

    alsa-ucm-conf' = pkgs.alsa-ucm-conf.overrideAttrs (prev: {
      postInstall = prev.postInstall or "" + ''
        cp -r ${alsa-ucm-conf-cros}/ucm2/. $out/share/alsa/ucm2
        cp -r ${alsa-ucm-conf-cros}/overrides/. $out/share/alsa/ucm2/conf.d
      '';
    });

    systemWide = config.services.pipewire.systemWide;
    extraEnv = {
      ALSA_CONFIG_UCM2 = "${alsa-ucm-conf'}/share/alsa/ucm2";
    };
  in
  {
    environment.variables = extraEnv;
    systemd.services = lib.mkIf systemWide {
      pipewire.environment = extraEnv;
      wireplumber.environment = extraEnv;
    };
    systemd.user.services = lib.mkIf (!systemWide) {
      pipewire.environment = extraEnv;
      wireplumber.environment = extraEnv;
    };

    boot.extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=3
    '';

    # remove if you already have hardware.enableRedistributableFirmware enabled
    hardware.firmware = [ pkgs.sof-firmware ];

    services.pipewire.wireplumber.extraConfig = {
      # idk i found this in the setup script
      increase-headroom = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                node.name = "~alsa_output.*";
              }
            ];
            actions = {
              update-props = {
                api.alsa.headroom = 2048;
              };
            };
          }
        ];
      };
    };
  };
}


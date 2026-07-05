{ self, inputs, ... }: {
  flake.nixosModules.chromebookAudio = { config, pkgs, lib, ... }:
	#  let
	#    cb-ucm-conf = with pkgs; alsa-ucm-conf.overrideAttrs {
	#      wttsrc = fetchFromGitHub {
	#        owner = "WeirdTreeThing";
	# repo = "alsa-ucm-conf-cros";
	# rev = "a4e92135fd49e669b5ce096439289e05e25ae90c";
	#        hash = "sha256-3TpzjmWuOn8+eIdj0BUQk2TeAU7BzPBi3FxAmZ3zkN8=";
	#      };
	#      unpackPhase = ''
	#        runHook preUnpack
	# tar xf "$src"
	# runHook postUnpack
	#      '';
	#      installPhase = ''
	#        runHook preInstall
	# mkdir -p $out/share/alsa
	# cp -r alsa-ucm*/ucm2 $out/share/alsa
	# runHook postInstall
	#      '';
	#    };
  # in
  {
    boot = {
      extraModprobeConfig = ''
        options snd-intel-dspcfg dsp_driver=3
      '';
    };

    environment = {
      systemPackages = [ pkgs.sof-firmware ];
      # sessionVariables.ALSA_CONFIG_UCM2 = "${cb-ucm-conf}/share/alsa/ucm2";
      etc = {
        "wireplumber/main.lua.d/51-increase-headroom.lua".text = ''
          rule = {
	    matches = {
              {
                { "node.name", "matches", "alsa_output.*" },
              },
            },
            apply_properties = {
              ["api.alsa.headroom"] = 4096,
            },
          }

          table.insert(alsa_monitor.rules,rule)
        '';
      };
    };

	#    system.replaceDependencies.replacements = [
	#      ({
	#        original = pkgs.alsa-ucm-conf;
	# replacement = cb-ucm-conf;
	#      })
	#    ];
  };
}

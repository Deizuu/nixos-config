{ self, inputs, ... }: {
  flake.nixosModules.chromebookAudio = { config, pkgs, lib, ... }:
  let
    cb-ucm-conf = with pkgs; alsa-ucm-conf.overrideAttrs {
      wttsrc = fetchFromGitHub {
        owner = "WeirdTreeThing";
	repo = "alsa-ucm-conf-cros";
	rev = "6b395ae73ac63407d8a9892fe1290f191eb0315b";
        hash = "sha256-GHrK85DmiYF6FhEJlYJWy6aP9wtHFKkTohqt114TluI=";
      };
      unpackPhase = ''
        runHook preUnpack
	tar xf "$src"
	runHook postUnpack
      '';
      installPhase = ''
        runHook preInstall
	mkdir -p $out/share/alsa
	cp -r alsa-ucm*/ucm2 $out/share/alsa
	runHook postInstall
      '';
    };
  in
  {
    environment = {
      systemPackages = [ pkgs.sof-firmware ];
      sessionVariables.ALSA_CONFIG_UCM2 = "${cb-ucm-conf}/share/alsa/ucm2";
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

    system.replaceDependencies.replacements = [
      ({
        original = pkgs.alsa-ucm-conf;
	replacement = cb-ucm-conf;
      })
    ];
  };
}

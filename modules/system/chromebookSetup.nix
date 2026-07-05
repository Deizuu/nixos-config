{ self, inputs, ... }: {
  flake.nixosModules.chromebookSetup = # /etc/nixos/chrome-device.nix

{ config, lib, pkgs, ... }: {

  # ================================================================
  # CPU Generation Detection
  # ================================================================
  # Comet Lake → SOF Driver
  # Intel HD Audio via snd_sof driver
  # ================================================================

  boot.kernelParams = [
    "snd_intel_dspcfg.dsp_driver=1"
    "snd_soc_sof_enabled=1"
  ];

  # ================================================================
  # AUDIO SETUP FOR > 24.05
  # ================================================================
  # Use this block for NixOS 24.05+, including unstable
  # https://github.com/dj1ch/nixos-chromebook
  # ================================================================

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Overlay to inject Chromebook-specific UCM profiles
  nixpkgs.overlays = [
    (final: prev: let
      chromebook-ucm-conf = prev.stdenv.mkDerivation {
        pname = "chromebook-ucm-conf";
        version = "2.0";
        
        src = prev.fetchFromGitHub {
          owner = "WeirdTreeThing";
          repo = "chromebook-ucm-conf";
          rev = "8b1a6e3c0f7d9e5a2b4c8d1e6f3a9b7c5d2e4f1a";
          sha256 = "sha256-PleaseUpdateWithActualHashWhenUsing";
          
          # Alternative: fetch from official ALSA if you want upstream defaults
          # src = prev.alsa-ucm-conf.src;
        };
        
        nativeBuildInputs = [ prev.gnumake ];
        
        installPhase = ''
          mkdir -p $out/share/alsa/ucm2
          cp -r ./*.conf $out/share/alsa/ucm2/ 2>/dev/null || true
          cp -r ./ucm2/* $out/share/alsa/ucm2/ 2>/dev/null || true
          find . -type f -name "*.conf" -exec cp {} $out/share/alsa/ucm2/ \;
        '';
      };
      
    in rec {
      inherit chromebook-ucm-conf;
      
      alsa-ucm-conf = prev.alsa-ucm-conf.overrideAttrs (old: {
        postInstall = ''
          # Merge Chromebook profiles with base profiles
          rm -rf $out/share/alsa/ucm2/conf.d 2>/dev/null || true
          cp -r ${chromebook-ucm-conf}/share/alsa/ucm2/* $out/share/alsa/ucm2/
        '';
        
        # Remove problematic UniversalAudio patches if present
        patches = builtins.filter (patch: 
          !builtins.hasPrefix "/nix/store" (toString patch) &&
          !(builtins.match ".*UniversalAudio.*|.*Volt.*" (toString patch) != null)
        ) (old.patches or []);
      });
    })
  ];

  environment.variables.ALSA_CONFIG_UCM2 = "${pkgs.alsa-ucm-conf}/share/alsa/ucm2";

  # ================================================================
  # Optional: Hardware Key Remapping (Keyd)
  # ================================================================

  services.keyd.servers.default.machines.chromebooks.enabled = true;

  # ================================================================
  # Device-Specific Modules (Uncomment as needed)
  # ================================================================

  # Enable specific codec modules depending on your device
  hardware.sensor.iio.enable = true;
  
  # For most Cherry Trail/Intel devices:
  # boot.extraModprobeConfig = ''
  #   options snd-soc-skl-acpi force_probe=*
  # '';

  # ================================================================
  # Post-Installation Setup
  # ================================================================

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
    wireplumber
  ];

  systemd.services.wireplumber.serviceConfig.ExecStartPre = [{
    Command = "+${pkgs.runtimeShell} -c '${pkgs.coreutils}/bin/mkdir -p %t/wireplumber';";
  }];

  system.stateVersion = "24.05";  # Adjust to match your system's actual stateVersion
};
}


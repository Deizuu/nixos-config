{ self, inputs, ... }: {
  flake.nixosModules.chromebookSetup = { pkgs, ... }: {
    boot.extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
    '';
    
    hardware.firmware = [ pkgs.sof-firmware ];

    services.pipewire.wireplumber.extraConfig = {
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


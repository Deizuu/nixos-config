{
  nixos.modules.pc = {
    services.pipewire.jack.enable = true;
    services.pipewire.extraConfig.jack = {
      "99-low-latency" = {
        "jack.properties" = {
	        "node.latency" = "512/48000";
	      };
      };
    };
  };
}

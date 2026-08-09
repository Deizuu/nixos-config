{
  nixos.modules.wol = {
    networking = {
      interfaces.eno2 = {
        wakeOnLan.enable = true;
      };
      firewall = {
        allowedUDPPorts = [ 9 ];
      };
    };
  };
}

{ self, ... }: {
  flake.modules.nixos.users = {
    dzu.users.deizu = {
      name = "deizu";
      description = "Deizu";
      extraGroups = [ "wheel" ];
      module = {
        imports = [
          self.modules.hm.deizu
        ];
      };
    };
  };
  flake.modules.hm.deizu = {
    home.sessionVariables = {
      SSH_AUTH_SOCK = "/home/deizu/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"; # TODO find a purer way to set this (maybe imperatively after installing Bitwarden Desktop?)
    };
  };
}

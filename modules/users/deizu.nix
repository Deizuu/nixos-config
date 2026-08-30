{ self, ... }: {
  flake.modules.nixos.base = {
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
    dzu.allowUnfreePackages = [
      "clonehero"
      "osu-lazer-bin"
    ];
  };
  flake.modules.hm.deizu = { pkgs, ... }: {
    home.sessionVariables = {
      SSH_AUTH_SOCK = "/home/deizu/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"; # TODO find a purer way to set this (maybe imperatively after installing Bitwarden Desktop?)
    };

    dzu.apps = {
      blender.enable = true;
      distrobox.enable = true;
      element.enable = true;
      ente.enable = true;
      gimp.enable = true;
      github-cli.enable = true;
      kdeconnect.enable = true;
      kdenlive.enable = true;
      neovim = {
        enable = true;
        defaultEditor = true;
      };
      opencode.enable = true;
      proAudio.enable = true;
      rclone.enable = true;
      ripgrep.enable = true;
      signal.enable = true;
      zen-browser.enable = true;
      zennotes.enable = true;

      games = {
        enable = true;
        games = with pkgs; [
          clonehero
          osu-lazer-bin
        ];
      };
    };
  };
}

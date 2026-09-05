{ self, ... }: {
  flake.modules.nixos.base = {
    dzu.users.deizu = {
      name = "deizu";
      description = "Deizu";
      extraGroups = [
        "wheel"
        "audio"
        "lpadmin"
      ];
      module = self.modules.homeManager.deizu;
    };
    dzu.allowUnfreePackages = [
      "clonehero"
      "osu-lazer-bin"
    ];
  };
  flake.modules.homeManager.deizu = { pkgs, ... }: {
    imports = [
      self.modules.homeManager.base
      self.modules.homeManager.gui
    ];

    home.sessionVariables = {
      SSH_AUTH_SOCK = "/home/deizu/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"; # TODO find a purer way to set this (maybe imperatively after installing Bitwarden Desktop?)
    };
    programs.git.settings.user = {
      name = "Deizuu";
      email = "120480615+Deizuu@users.noreply.github.com";
    };
    dzu.zsh.enable = true;
    dzu.apps = {
      blender.enable = true;
      chromium.enable = true;
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

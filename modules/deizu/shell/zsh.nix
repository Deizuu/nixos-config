{ config, ... }: {
  my.user.home.base = {
    programs.zsh = {
      enable = true;
    };
  };

  nixos.modules.base = { pkgs, ... }: {
    programs.zsh.enable = true;
    users.users.${config.my.user.name} = {
      shell = pkgs.zsh;
    };
  };
}

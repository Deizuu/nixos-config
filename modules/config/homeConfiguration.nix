{ self, inputs, ... }: {
  flake.homeConfigurations.user = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86-64_linux"; };
    modules = [
      self.homeModules.userModule
    ];
  };

  flake.homeModules.userModule = { config, pkgs, ... }: {
    imports = with self.homeModules; [
      alacritty
      btop
      fonts
      neovim
      proAudio
      pwJackConfig
      starship
      zsh
    ];
    home.stateVersion = "26.05";
    
    home.packages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}

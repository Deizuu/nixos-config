{
  flake.homeConfigurations.user = inputs.home-manager.lib.homeManagerConfiguration {
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

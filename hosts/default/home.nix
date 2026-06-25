{ config, pkgs, inputs, osConfig, ... }:
let
  hmModulesPath = ../../modules/home-manager; 
in
{
  imports = [
    (hmModulesPath + "/cliPrograms/btop.nix")
    (hmModulesPath + "/cliPrograms/clipman.nix")
    (hmModulesPath + "/cliPrograms/neovim.nix")
    #(hmModulesPath + "/cliPrograms/starship.nix")
    #(hmModulesPath + "/cliPrograms/zsh.nix")

    #(hmModulesPath + "/guiPrograms/alacritty.nix")
    (hmModulesPath + "/guiPrograms/proAudio.nix")

    (hmModulesPath + "/pwJackConfig.nix")
  ];
  home.stateVersion = "26.05"; # Do not change unless you know what you are doing (this will not update the system)

  programs.home-manager.enable = true;

  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
	pkgs.kdePackages.kdeconnect-kde
  ];
}

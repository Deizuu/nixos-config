{ config, pkgs, inputs, ... }:
let
  username = config.myUser.username;
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
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05"; # Do not change unless you know what you are doing (this will not update the system)

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true; # Allows unfree packages to be installed for the user
  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.steam
	pkgs.kdePackages.kdeconnect-kde
  ];
}

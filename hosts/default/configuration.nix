# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/nixos/boot.nix
      ../../modules/nixos/desktopGnome.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/locale.nix
      ../../modules/nixos/audioPipewire.nix
      ../../modules/nixos/printing.nix
      ../../modules/nixos/nix-settings.nix
    ];

  home-manager = {
    backupFileExtension = "backup";
    overwriteBackup = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      config.myUser.username = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    wl-clipboard
    git
  ];

  system.stateVersion = "26.05";
}

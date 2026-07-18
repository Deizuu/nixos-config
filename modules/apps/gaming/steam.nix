{
  nixos.modules.pc = {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
    };
  };

  allowUnfreePackages = [
    "steam"
    "steam-unwrapped"
  ];
}

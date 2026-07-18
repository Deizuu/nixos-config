{ lib, ... }: {
  nixos.modules.pc = {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
    };

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
    ];
  };
}

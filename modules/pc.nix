{ self, ... }: {
  flake.modules.nixos.pc = {
    imports = with self.modules.nixos; [
      base

      autoTime
      location
      printing

      gdm
      lightdm
      
      gnome
      xfce
    ];
  };
}

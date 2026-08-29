{
  flake.modules.hm.base =
    { config, lib, ... }:
    let
      cfg = config.dzu.zsh;
    in
    {
      config = lib.mkIf cfg.enable {
        programs.starship = {
          enable = true;
          enableZshIntegration = true;
          settings = {
            add_newline = false;

            format = lib.concatStrings [
              "\n"
              "$username"
              "$directory"
              "\n"
              "$all"
              "$status"
              "$shlvl"
              "$character"
            ];
            username = {
              show_always = true;
            };
            directory = {
              truncate_to_repo = false;
            };
            direnv.disabled = false;
            status = {
              disabled = false;
              format = "[$symbol]($style)";
            };
            shlvl.disabled = false;
          };
        };
      };
    };
}

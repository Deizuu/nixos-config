{
  my.user.home.base = { lib, ... }: {
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
        direnv.disabled = false;
        status = {
          disabled = false;
          format = "[$symbol]($style)";
        };
        shlvl.disabled = false;
        username = {
          show_always = true;
        };
      };
    };
  };
}

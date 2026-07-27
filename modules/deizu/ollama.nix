{
  my.user.home.base = { pkgs, ... }: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cpu;
      acceleraton = false; # enable when getting new GPU
    };
  };
}

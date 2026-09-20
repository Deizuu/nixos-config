{
  flake.modules.homeManager.gui = {
    programs.zen-browser.profiles."Default".settings = {
      "zen.welcome-screen.seen" = true;
    };
  };
}

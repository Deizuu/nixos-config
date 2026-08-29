{
  flake.modules.hm.gui = {
    programs.zen-browser.profiles."Default".search = {
      force = true;
      default = "qwant";
    };
  };
}

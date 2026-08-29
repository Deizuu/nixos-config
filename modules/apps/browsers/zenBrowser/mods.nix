{
  flake.modules.hm.gui = {
    programs.zen-browser.profiles."Default".mods = [
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
    ];
  };
}

{
  my.user.home.gui = { config, ... }: {
    programs.zen-browser.profiles."Default" = {
      spacesForce = true;
      spaces = {
        "General" = {
          id = "1a84df6e-e256-4e1c-8642-fec0f8926cc4";
          position = 1000;
        };

        "Other" = {
          id = "7cc94198-dc8f-42af-a713-6b5cf432f5c6";
          position = 2000;

          pins."Discord" = {
            id = "155a5cfc-8611-4695-8782-e6c91af3d39d";
            url = "https://discord.com/app";
            position = 100;
          };
        };
      };
    };
  };
}

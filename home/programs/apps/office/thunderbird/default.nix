{
  programs.thunderbird = {
    enable = true;
    profiles."supeen" = {
      isDefault = true;
      userChrome = "";
      userContent = "";
      withExternalGnupg = true;
    };
  };
}

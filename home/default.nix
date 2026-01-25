{osConfig, ...}: {
  imports = [
    ./programs
    ./services
  ];

  home = {
    username = "supeen";
    homeDirectory = osConfig.users.users.supeen.home;
    stateVersion = "25.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}

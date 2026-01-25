{osConfig, ...}: {
  imports = [
    ./editors
    ./programs
    ./services
    ./theme
  ];

  home = {
    username = "supeen";
    homeDirectory = osConfig.users.users.supeen.home;
    stateVersion = "26.05";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}

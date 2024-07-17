{
  imports = [
    ./editors
    ./programs
    ./services
    ./theme
  ];

  home = {
    username = "supeen";
    homeDirectory = "/home/supeen";

    stateVersion = "23.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}

{osConfig, ...}: let
  inherit (osConfig.nice.user) main;
  inherit (osConfig.users) users;
in {
  imports = [
    ./editors
    ./programs
    ./services
    ./theme
  ];

  home = {
    username = main;
    homeDirectory = users."${main}".home;

    stateVersion = "23.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "supeen";
      };
      default_session = initial_session;
    };
  };
}

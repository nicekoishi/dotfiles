{
  nice.modules.user = {
    environments = ["hyprland"];

    # NOTE: if position is not specified, default is 0x0
    monitors = {
      "HDMI-A-1" = {
        main = true;
        width = 1920;
        height = 1080;
      };
    };

    # NOTE: shouldn't this be the default for all desktop systems?
    # this includes laptops too
    home-manager.enable = true;
  };
}

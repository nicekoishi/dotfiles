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

      # testing headless display, it didn't work at all last time:
      # Hyprland, commit 6934e7aa2b300bc4565855a4092fb34de8a9a8d2
      #"WL-69" = {
      #  width = 1280;
      #  height = 720;
      #  pos = "left";
      #};
    };

    style = {
      gtk.forceTheme = true;
      qt.useKvantum = true;
    };

    # NOTE: shouldn't this be the default for all desktop systems?
    # this includes laptops too
    home-manager.enable = true;
  };
}

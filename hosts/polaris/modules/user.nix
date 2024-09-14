{self', ...}: let
  # confusing, I know. The inherited wallpapers is a passthru containing
  # an attrset with all available wallpapers.
  # don't want to use wallpkgs though
  inherit (self'.packages.wallpapers) wallpapers;
  inherit (wallpapers.standard) kayoko;
in {
  nice.user = {
    desktop.setup = ["Hyprland"];

    display = {
      main = "HDMI-A-1";

      # NOTE: if position is not specified, default is 0x0
      monitors = {
        "HDMI-A-1" = {
          width = 1920;
          height = 1080;

          wallpaper = kayoko;
        };

        # testing headless display, it didn't work at all last time:
        # Hyprland, commit 6934e7aa2b300bc4565855a4092fb34de8a9a8d2
        # "WL-69" = {
        #   width = 1280;
        #   height = 720;
        #   pos = "left";

        #   wallpaper = kayoko;
        # };
      };
    };

    style.qt = {
      useGtk = true;
      useKvantum = true;
    };

    # NOTE: shouldn't this be the default for all desktop systems?
    # this includes laptops too
    home-manager.enable = true;
  };
}

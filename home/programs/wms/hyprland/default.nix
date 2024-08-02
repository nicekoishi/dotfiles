{inputs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./config
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = {
      monitor = ["HDMI-A-1, 1920x1080, 0x0, 1"];
      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];
    };
  };
}

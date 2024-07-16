{inputs', ...}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs'.hyprland-plugins.packages.hyprexpo
    ];

    settings = {
      bind = ["ALT, TAB, hyprexpo:expo, toggle"];
      plugin.hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current";
      };
    };
  };
}

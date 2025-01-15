{
  inputs',
  pkgs,
  ...
}: let
  inherit (inputs') nix-gaming;
in {
  imports = [
    ./minecraft
    ./legendary
  ];

  home.packages = with pkgs; [
    lutris

#    nix-gaming.packages.wine-tkg
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      background_alpha = "0.5";
      fps_limit = "0,60";
      cpu_stats = true;
      cpu_temp = true;
      enableSessionWide = true;
      font_size = 24;
      fps = true;
      frame_timing = true;
      frametime = true;
      gpu_stats = true;
      gpu_temp = true;
      no_display = true;
      vulkan_driver = false;
      wine = true;
      toggle_hud = "Shift_R+F12";
      toggle_hud_position = "Shift_R+Home";
      toggle_fps_limit = "Shift_R+F1";
    };
  };
}

{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) nix-gaming;
in {
  imports = [
    ./minecraft
    ./legendary
  ];

  home.packages = with pkgs; [
    lutris

    nix-gaming.packages.${pkgs.system}.wine-ge
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      background_alpha = "0.5";
      cpu_stats = true;
      cpu_temp = true;
      font_size = 24;
      fps = true;
      frame_timing = true;
      frametime = true;
      gpu_stats = true;
      gpu_temp = true;
      vulkan_driver = false;
      wine = true;
      toggle_hud = "Shift_R+F12";
      toggle_hud_position = "Shift_R+Home";
    };
  };
}

{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.nice) user;
  inherit (lib.modules) mkIf;
in {
  imports = [./minecraft];

  config = mkIf user.apps.gaming {
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

    home.packages = with pkgs; [
      wineWow64Packages.stable
      winetricks
      #lutris

      # temporary fix
      # https://github.com/NixOS/nixpkgs/issues/513245#issuecomment-4319854191
      (pkgs.lutris.override {
        # Intercept buildFHSEnv to modify target packages
        buildFHSEnv = args:
          pkgs.buildFHSEnv (args
            // {
              multiPkgs = envPkgs: let
                # Fetch original package list
                originalPkgs = args.multiPkgs envPkgs;

                # Disable tests for openldap
                customLdap = envPkgs.openldap.overrideAttrs (_: {doCheck = false;});
              in
                # Replace broken openldap with the custom one
                builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [customLdap];
            });
      })
    ];
  };
}

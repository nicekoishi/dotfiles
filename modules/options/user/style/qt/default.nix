{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) bool package str;

  usr = config.nice.user;
  check = usr.home-manager.enable && usr.desktop.setup != null;
  style = usr.style.qt;
in {
  options.nice.user = {
    style.qt = {
      enable = mkEnableOption "QT Style Module" // {default = check;};

      useKvantum = mkOption {
        default = usr.style.qt.enable;
        type = bool;
        description = "Whether to use Kvantum for theming QT applications";
      };

      theme = {
        name = mkOption {
          default = "catppuccin-mocha-blue";
          type = str;
          description = "Name of the color scheme used by qtct";
        };

        package = mkOption {
          # nixpkgs is too old, this rev adds qt6ct support
          default = pkgs.catppuccin-qt5ct.overrideAttrs {
            version = "reeee";
            src = pkgs.fetchFromGitHub {
              owner = "catppuccin";
              repo = "qt5ct";
              rev = "cb585307edebccf74b8ae8f66ea14f21e6666535";
              hash = "sha256-wDj6kQ2LQyMuEvTQP6NifYFdsDLT+fMCe3Fxr8S783w=";
            };
          };
          type = package;
          description = "Package containing the qtct color schemes";
        };

        path = mkOption {
          default = "${style.theme.package}/share/qt5ct/colors";

          type = str;
          description = "Path to the qtct color schemes";
        };
      };

      #   # appending this do a new kdeglobals inside $HOME would be the best, but it would involve some
      #   # import from derivation shenanigans
      #   # TODO: Do it anyway
      #   kdeglobals = mkOption {
      #     default = "${style.theme.package}/share/color-schemes/CatppuccinMochaBlue.colors";
      #     type = str;
      #     description = ''
      #       The source file for the kdeglobals file. Usually provided by the QT theme package.
      #     '';
      #   };
      # };

      # mostly hard coded, what the heck
      # not like we're changing it anyway, keep it like that
      kvantum = {
        package = mkOption {
          default = pkgs.catppuccin-kvantum.override {
            accent = "blue";
            variant = "mocha";
          };
          type = package;
          description = "Path to the Kvantum theme package";
        };

        kvconfig = mkOption {
          default = "${style.kvantum.package}/share/Kvantum/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
          type = str;
          description = "Path to the Kvantum theme configuration file";
        };

        svg = mkOption {
          default = "${style.kvantum.package}/share/Kvantum/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
          type = str;
          description = "Path to the Kvantum theme SVG file";
        };
      };
    };
  };
}

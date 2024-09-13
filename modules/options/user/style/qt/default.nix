{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) length;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) bool package str;

  usr = config.nice.user;
  check = usr.home-manager.enable && (length usr.environments) > 0;
  style = usr.style.qt;
in {
  options.nice.user = {
    style.qt = {
      enable = mkEnableOption "QT Style Module" // {default = check;};

      useKvantum = mkOption {
        default = false;
        type = bool;
        description = "Whether to use Kvantum for theming QT applications";
      };

      theme = {
        name = mkOption {
          default = "Catppuccin-Mocha-Blue";
          type = str;
          description = ''
            Name of the theme inside the package.
            This will probably not be used by anything, but let's keep it here
          '';
        };

        package = mkOption {
          default = pkgs.catppuccin-kde.override {
            flavour = ["mocha"];
            accents = ["blue"];
            winDecStyles = ["modern"];
          };
          type = package;
          description = "The package providing the themes";
        };

        # appending this do a new kdeglobals inside $HOME would be the best, but it would involve some
        # import from derivation shenanigans
        # TODO: Do it anyway
        kdeglobals = mkOption {
          default = "${style.theme.package}/share/color-schemes/CatppuccinMochaBlue.colors";
          type = str;
          description = ''
            The source file for the kdeglobals file. Usually provided by the QT theme package.
          '';
        };
      };

      # mostly hard coded, what the heck
      # not like we're changing it anyway, keep it like that
      kvantum = {
        package = mkOption {
          default = pkgs.catppuccin-kvantum.override {
            accent = "Blue";
            variant = "Mocha";
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

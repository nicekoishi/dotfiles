{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) length pathExists toString;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) bool int package str;

  usr = config.nice.modules.user;
  check = usr.home-manager.enable && (length usr.environments) > 0;
  style = usr.style.gtk;
in {
  options.nice.modules.user = {
    style.gtk = {
      enable = mkEnableOption "GTK Style Module" // {default = check;};

      forceTheme = mkOption {
        default = false;
        type = bool;
        description = "Whether to force QT applications to use the GTK theme.";
      };

      iconTheme = {
        name = mkOption {
          default = "Papirus-Dark";
          type = str;
          description = "Name of the icon inside the package";
        };

        package = mkOption {
          default = pkgs.papirus-icon-theme;
          type = package;
          description = "The package providing the icons";
        };
      };

      font = {
        name = mkOption {
          default = "Iosevka";
          type = str;
          description = ''
            Name of the font that will be used by GTK applications

            It should already be installed by `config.fonts.packages`!
          '';
        };

        size = mkOption {
          default = 12;
          type = int;
          description = "Size of the font used by GTK applications";
        };
      };

      theme = {
        name = mkOption {
          default = "Colloid-Dark-Compact-Catppuccin";
          type = str;
          description = "Name of the theme inside the package";
        };

        package = mkOption {
          default = pkgs.colloid-gtk-theme.override {
            themeVariants = ["default"]; # default: blue
            colorVariants = ["dark"]; # wait, so this package can build both... should i do it again?
            sizeVariants = ["compact"];
            tweaks = ["catppuccin"];
          };
          type = package;
          description = "The package providing the theme";
        };
      };
    };
  };

  #https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/options/style/gtk.nix#L70
  config = {
    assertions = [
      (let
        themePath = style.theme.package + "/share/themes" + "/${style.theme.name}";
      in {
        assertion = style.enable -> pathExists themePath;
        message = ''
          ${toString themePath} set by the GTK module does not exist!

          To suppress this message, make sure that
          `config.nice.modules.user.style.gtk.theme.package` contains
          the path `${style.theme.name}`
        '';
      })
    ];
  };
}

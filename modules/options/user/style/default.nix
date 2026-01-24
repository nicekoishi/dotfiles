{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) int package str;
in {
  imports = [
    ./gtk
    ./qt
  ];

  options.nice.user = {
    style = {
      cursor = {
        name = mkOption {
          default = "Bibata-Modern-Classic";
          type = str;
          description = "Name of the cursor inside the package";
        };

        package = mkOption {
          default = pkgs.bibata-cursors;
          type = package;
          description = "The package providing the cursors";
        };

        size = mkOption {
          default = 24;
          type = int;
          description = "The size of the cursor";
        };
      };
    };
  };
}

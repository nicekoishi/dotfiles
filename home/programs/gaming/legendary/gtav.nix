{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) nix-gaming;
in {
  home.packages =
    []
    ++ (nix-gaming.lib.legendaryBuilder pkgs
      {
        games = {
          grand-theft-auto-v = {
            desktopName = "Grand Theft Auto V";
            tricks = ["dxvk" "win10"];

            icon = builtins.fetchurl {
              url = "https://github.com/nicekoishi/dotfiles/assets/89671198/1f7b6255-23e8-4303-8445-b047872f03c2";
              name = "grand-theft-auto-v.png";
              sha256 = "0dfbrx75d2bwzq9bji769z2q16w632wggfvkrplq32niy4yjhdnx";
            };

            discordIntegration = true;
            gamemodeIntegration = true;

            preCommands = ''
              export MANGOHUD=1
              echo "sharkcard games is online"
            '';

            postCommands = ''
              echo "no shark cards for ya"
            '';
          };
        };

        opts = {
          wine = nix-gaming.packages.${pkgs.system}.wine-ge;
        };
      });
}

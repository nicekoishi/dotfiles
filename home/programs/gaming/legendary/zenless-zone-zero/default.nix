{
  pkgs,
  inputs,
  ...
}: {
  home.packages =
    []
    ++ (inputs.nix-gaming.lib.legendaryBuilder pkgs
      {
        games.zenless-zone-zero = {
          desktopName = "Zenless Zone Zero";
          tricks = ["dxvk" "vcrun2015" "win10"];
          location = "$HOME/.local/share/nix-gaming";

          icon = builtins.fetchurl {
            url = "https://github.com/nicekoishi/dotfiles/assets/89671198/23be394e-1980-4ffc-a7c4-7626e3273b29";
            name = "zenless-zone-zero.png";
            sha256 = "00vdryzdq1km9xv8nkqdlz6fpizj38w7rxnl0s5zdrqmw3n7b2rw";
          };

          discordIntegration = true;
          gamemodeIntegration = true;

          preCommands = ''
            export MANGOHUD=1
            echo "Game Starting!"
          '';

          postCommands = ''
            echo "Game Ended!"
          '';
        };

        opts = {
          wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg;
        };
      });
}

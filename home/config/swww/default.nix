{
  config,
  pkgs,
  ...
}: let
  wallpapers = "${config.xdg.userDirs.pictures}/Wallpapers";
  timer = pkgs.writeShellScriptBin "walld" ''
    swww-daemon &

    while true
    do
    swww img -o HDMI-A-1 "${wallpapers}/$(ls ${wallpapers} | shuf -n 1)"
    sleep 300
    done
  '';
in {
  home.packages = [
    pkgs.swww
    timer
  ];
}

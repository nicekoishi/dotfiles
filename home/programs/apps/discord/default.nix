{pkgs, ...}: {
  home.packages = with pkgs; [
    webcord-vencord
  ];

  xdg.configFile."WebCord/Themes/theme".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-teal.theme.css");
  '';
}

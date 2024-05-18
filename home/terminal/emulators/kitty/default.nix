{
  lib,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    extraConfig = "include theme.conf";
    # this is here just to install all themes
    theme = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.71";
      term = "xterm-256color";

      notify_on_command_finish = "unfocused notify";

      scrollback_lines = 10000;
      enable_audio_bell = true;

      font_family = "Iosevka Nerd Font Propo";
      font_size = 12;
    };
  };

  home.activation = {
    # we could use mkOutOfStoreSymlink, but then I could accidentaly break something here
    # so we just "fix" the file by overwritting its contents every time
    # this is stupid, but i don't want to use specialisations
    kitty-theme = lib.hm.dag.entryAfter ["writeBoundary"] ''
      touch "${config.xdg.configHome}/kitty/theme.conf"
      if [ ! -s "${config.xdg.configHome}/kitty/theme.conf" ]; then
        run echo "include current_theme.conf" > "${config.xdg.configHome}/kitty/theme.conf"
      fi
    '';
  };
}

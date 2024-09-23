{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.71";
      term = "xterm-256color";

      notify_on_cmd_finish = "unfocused";

      scrollback_lines = 10000;
      enable_audio_bell = true;

      font_family = "Iosevka Nerd Font Propo";
      font_size = 12;
    };
  };
}

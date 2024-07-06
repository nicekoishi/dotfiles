{
  programs.gamescope = {
    enable = true;
    capSysNice = true;

    args = [
      "--rt"
      "--expose-wayland"
    ];
  };
}

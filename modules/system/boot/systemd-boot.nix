{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = null; # do not change this for the love of god
      consoleMode = "max";

      memtest86.enable = true;
    };
  };
}

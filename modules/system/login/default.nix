{
  imports = [
    ./greeter.nix
    ./pam.nix
  ];

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 2;
    };
  };

  # https://github.com/apognu/tuigreet/issues/68#issuecomment-1586359960
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}

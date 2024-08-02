{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (elem "desktop" cfg.roles) {
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
  };
}

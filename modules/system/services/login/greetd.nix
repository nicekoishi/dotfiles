{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
    services.greetd = {
      enable = true;
      settings = {
        terminal.vt = mkForce 2;
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

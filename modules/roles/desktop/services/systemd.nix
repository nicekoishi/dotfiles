{
  systemd = let
    timeout = ''
      DefaultTimeoutStartSec=10s
      DefaultTimeoutStopSec=10s
    '';
  in {
    extraConfig = timeout;
    user.extraConfig = timeout;
  };
}

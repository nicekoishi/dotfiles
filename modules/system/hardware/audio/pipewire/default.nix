{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  inherit (config.nice.host) opts;
in {
  imports = [
    ./low-latency.nix
    ./settings.nix
  ];

  config = mkIf opts.capabilities.audio {
    services = {
      pulseaudio.enable = mkForce false;

      pipewire = {
        enable = true;

        audio.enable = true;
        jack.enable = true;
        pulse.enable = true;
      };
    };

    security.rtkit.enable = true;
  };
}

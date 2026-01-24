{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf mkForce;
  inherit (config.nice.host.opts) roles;
in {
  imports = [
    ./low-latency.nix
    ./settings.nix
  ];

  services = mkIf (elem "desktop" roles) {
    pulseaudio.enable = mkForce false;

    pipewire = {
      enable = true;

      audio.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = elem "desktop" roles;
}

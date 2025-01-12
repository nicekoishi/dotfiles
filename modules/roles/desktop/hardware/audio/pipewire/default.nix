{lib, ...}: let
  inherit (lib.modules) mkForce;
in {
  imports = [
    ./low-latency.nix
    ./settings.nix
  ];

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
}

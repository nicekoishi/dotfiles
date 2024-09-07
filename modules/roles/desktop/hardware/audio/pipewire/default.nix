{lib, ...}: let
  inherit (lib.modules) mkForce;
in {
  imports = [
    ./low-latency.nix
    ./settings.nix
  ];

  services.pipewire = {
    enable = true;

    audio.enable = true;
    jack.enable = true;
    pulse.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = mkForce false;
}

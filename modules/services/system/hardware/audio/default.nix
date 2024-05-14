{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.generators) toLua;

  quantum = 64;
  rate = 48000;
  qr = "${toString quantum}/${toString rate}";
in {
  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };

    # https://github.com/fufexan/nix-gaming/blob/master/modules/pipewireLowLatency.nix
    extraConfig.pipewire."99-lowlatency" = {
      context = {
        properties.default.clock.min-quantum = quantum;
        modules = [
          {
            name = "libpipewire-module-rtkit";
            flags = ["ifexists" "nofail"];
            args = {
              nice.level = -15;
              rt = {
                prio = 88;
                time.soft = 200000;
                time.hard = 200000;
              };
            };
          }
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              server.address = ["unix:native"];
              pulse.min = {
                req = qr;
                quantum = qr;
                frag = qr;
              };
            };
          }
        ];

        stream.properties = {
          node.latency = qr;
          resample.quality = 1;
        };
      };
    };

    wireplumber = {
      enable = true;
      configPackages = let
        # generate "matches" section of the rules
        matches = toLua {
          multiline = false; # looks better while inline
          indent = false;
        } [[["node.name" "matches" "alsa_output.*"]]]; # nested lists are to produce `{{{ }}}` in the output

        # generate "apply_properties" section of the rules
        apply_properties = toLua {} {
          "audio.format" = "S32LE";
          "audio.rate" = rate * 2;
          "api.alsa.period-size" = 2;
        };
      in [
        (pkgs.writeTextDir "share/lowlatency.lua.d/99-alsa-lowlatency.lua" ''
          alsa_monitor.rules = {
            {
              matches = ${matches};
              apply_properties = ${apply_properties};
            }
          }
        '')
      ];
    };
  };

  hardware.pulseaudio.enable = lib.mkForce false;
}

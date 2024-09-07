# https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/core/common/system/hardware/multimedia/sound/servers/pipewire/low-latency.nix
let
  inherit (builtins) toString;

  # latency = (quantum / rate) * 1000 (in ms)
  # for this case (64 / 48000), the latency is about 1.33ms
  quantum = toString 64;
  rate = toString 48000;
  qr = "${quantum}/${rate}";
in {
  # https://github.com/musnix/musnix/blob/b5f3a47fd74193cb98c85cfeb6a25358150bdd90/modules/base.nix#L76
  boot.kernelParams = ["threadirqs"];

  services.pipewire = {
    extraConfig = {
      client."99-low-latency" = {
        stream.properties = {
          node.latency = qr;
          resample.quality = 1;
        };
      };

      pipewire."99-low-latency" = {
        context.properties = {
          default.clock = {
            inherit rate quantum;
            min-quantum = quantum;
            max-quantum = quantum;
            allowed-rates = [rate];
          };
        };

        context.modules = [
          {
            name = "libpipewire-module-rtkit";
            flags = ["ifexists" "nofail"];
            args = {
              nice.level = -15;
              rt = {
                prio = 90;
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
                quantum = qr;
                req = qr;
                frag = qr;
              };
            };
          }
        ];
      };

      pipewire-pulse."99-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args.pulse = {
              default.req = qr;
              min.req = qr;
              max.req = qr;
              min.quantum = qr;
              max.quantum = qr;
            };
          }
        ];

        stream.properties = {
          node.latency = qr;
          resample.quality = 4;
        };
      };
    };

    wireplumber = {
      enable = true;
      extraConfig = {
        "99-low-latency" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                {"device.name" = "~alsa_card.*";}
                {"node.name" = "~alsa_output.*";}
              ];

              actions.update-props = {
                node.description = "ALSA Low Latency Output";
                audio.format = "S32LE";
                audio.rate = rate;
                resample.disable = false;
                resample.quality = 4;

                api.alsa = {
                  disable-batch = false;
                  headroom = 128;
                  period-num = 2;
                  period-size = 2;
                };

                # https://wiki.archlinux.org/title/PipeWire#Noticeable_audio_delay_or_audible_pop/crack_when_starting_playback
                session.suspend-timeout-seconds = 0;
              };
            }
          ];
        };
      };
    };
  };
}

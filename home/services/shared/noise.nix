# shamelessy stolen from fufexan/dotfiles
{
  config = {
    services.pipewire = {
      enable = true; # this only enable configurations, not pipewire itself
      configs = {
        "99-input-denoising" = {
          "context.modules" = [
            {
              "name" = "libpipewire-module-filter-chain";
              "args" = {
                "node.description" = "Noise Canceling source";
                "media.name" = "Noise Canceling source";
                "filter.graph" = {
                  "nodes" = [
                    {
                      "type" = "ladspa";
                      "name" = "rnnoise";
                      "plugin" = "librnnoise_ladspa";
                      "label" = "noise_suppressor_mono";
                      "control" = {
                        "VAD Threshold (%)" = 50.0;
                        "VAD Grace Period (ms)" = 200;
                        "Retroactive VAD Grace (ms)" = 0;
                      };
                    }
                  ];
                };
                "audio.position" = ["FL" "FR"];
                "capture.props" = {
                  "node.name" = "effect_input.rnnoise";
                  "node.passive" = true;
                };
                "playback.props" = {
                  "node.name" = "effect_output.rnnoise";
                  "media.class" = "Audio/Source";
                };
              };
            }
          ];
        };
      };
    };
  };
}

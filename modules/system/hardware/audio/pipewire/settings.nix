{lib, ...}: let
  inherit (lib.attrsets) mapAttrs;
  inherit (lib.modules) mkOptionDefault;

  # mkOptionDefault is a mkOverride with a value of 1500
  # lower values are preferred in the case of a conflict, and with a value
  # of 1500, even mkDefault can override this - as it has a value of 1000
  # https://github.com/NixOS/nixpkgs/blob/d68746a3c4ccce698285e1f7a4760a61a756ff47/lib/modules.nix#L1031
  mapOptionDefault = mapAttrs (_: mkOptionDefault);
in {
  services.pipewire.extraConfig = {
    # https://docs.pipewire.org/page_man_pipewire_conf_5.html
    pipewire = {
      "10-logging" = {
        # talk to me, pipewire
        context.properties = {
          log.level = 3;
        };
      };

      "10-defaults" = {
        context.properties = mapOptionDefault {
          clock.power-of-two-quantum = true;
          link.max-buffers = 16; # default to 64;
          core = {
            daemon = true;
            name = "pipewire-0";
          };
          settings = {
            check-quantum = true; # default to false
            check-rate = true; # default to false
          };
        };

        context.spa-libs = mapOptionDefault {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "avb.*" = "avb/libspa-avb";
          "api.alsa.*" = "alsa/libspa-alsa";
          "api.v4l2.*" = "v4l2/libspa-v4l2";
          "api.libcamera.*" = "libcamera/libspa-libcamera";
          "api.bluez5.*" = "bluez5/libspa-bluez5";
          "api.vulkan.*" = "vulkan/libspa-vulkan";
          "api.jack.*" = "jack/libspa-jack";
          "support.*" = "support/libspa-support";
          "video.convert.*" = "videoconvert/libspa-videoconvert";
        };
      };
    };
  };
}

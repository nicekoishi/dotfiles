{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkDefault mkForce;

  cfg = config.nice.host;
  sys = cfg.system;
in {
  boot = {
    consoleLogLevel = 3;

    initrd = {
      verbose = false;
      systemd.enable = true;
      supportedFilesystems = ["ntfs"];
    };

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = mkForce 2; # see configurationLimit
    };

    kernelPackages = mkDefault sys.kernel;

    # https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/core/common/system/os/boot/generic.nix#L127
    kernelParams = [
      /*
         CPU idle behaviour
      poll: slightly improve performance at cost of a hotter system (not recommended)
      halt: halt is forced to be used for CPU idle
      nomwait: Disable mwait for CPU C-states
      */
      "idle=nomwait" # poll | halt | nomwait

      # single gpu passthrough is fun
      "iommu=pt"

      # prevent the kernel from blanking plymouth out of the fb
      "fbcon=nodefer"

      # disabling cursor in vt
      "vt.global_cursor_default=0"

      # disable displaying of the builtin linux logo
      "logo.nologo"

      # silent boot
      # shush
      "quiet"

      # lowring udev log level
      "udev.log_level=3"
      "rd.udev.log_level=3"

      # disabling systemd status messages
      "systemd-show_status=auto"
      "rd.systemd.show_status=auto"
    ];
  };
}

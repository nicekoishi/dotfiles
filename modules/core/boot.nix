{
  pkgs,
  config,
  self,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    initrd = {
      verbose = false;
      systemd.enable = true;
      supportedFilesystems = ["ntfs"];
    };

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 2; # see configurationLimit
      systemd-boot = {
        enable = true;
        configurationLimit = null; # had a sad experience with a broken initrd earlier, let's keep this on
        consoleMode = "max";
      };
    };

    consoleLogLevel = 3;
    kernelParams = [
      # useful stuff

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

    plymouth = {
      enable = true;
      theme = "funny-plymouth";
      themePackages = [self.packages."${pkgs.system}".funny-plymouth];
    };
  };
}

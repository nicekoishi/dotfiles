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
      timeout = 0;
      systemd-boot = {
        enable = true;
        configurationLimit = 12;
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
  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}

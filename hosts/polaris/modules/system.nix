{
  config,
  pkgs,
  ...
}: {
  nice.host.system = {
    kernel = pkgs.linuxPackages_zen;
  };

  boot = {
    kernelModules = ["v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  };
}

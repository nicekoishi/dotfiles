{pkgs, ...}: {
  nice.host.system = {
    kernel = pkgs.linuxPackages_zen;
  };
}

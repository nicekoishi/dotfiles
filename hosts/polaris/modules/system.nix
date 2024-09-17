{pkgs, ...}: {
  nice.host.system = {
    kernel = pkgs.linuxPackages_cachyos;
    gpg.enable = true;
  };

  environment.systemPackages = [pkgs.scx];
}

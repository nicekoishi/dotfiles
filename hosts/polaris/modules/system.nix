{pkgs, ...}: {
  nice.host.system = {
    kernel = pkgs.linuxPackages_zen;
    gpg.enable = true;
  };

  # environment.systemPackages = [pkgs.scx_git.full];
}

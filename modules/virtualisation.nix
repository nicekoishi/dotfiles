{pkgs, ...}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [pkgs.OVMFFull.fd];
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    storageDriver = "btrfs";
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;

    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    archive-team-warrior = {
      image = "atdr.meo.ws/archiveteam/reddit-grab";
      autoStart = true;
      cmd = ["nicekoishi"];
      extraOptions = ["--network=host"];
    };
  };
}

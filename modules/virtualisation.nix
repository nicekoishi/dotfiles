{pkgs, ...}: {
  # proper kernel opts and modules
  boot = {
    # intel only i think, amd ftw
    # kernelParams = ["intel-iommu=on" "iommu=pt"];
    kernelModules = ["kvm-amd" "vfio-pci"];
  };

  # per machine hooks in libvirt/
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [pkgs.OVMFFull.fd];
    };
  };

  # sleeping when doing pci passthrough is fun
  systemd.services."libvirt-nosleep@" = {
    description = "Preventing sleep while libvirt domain \"%i\" is running";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.systemd}/bin/systemd-inhibit --what=sleep --why=\"Libvirt domain \"%i\"\" is running --who=%U --mode=block sleep infinity";
    };
  };

  # if using without passthrough
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
}

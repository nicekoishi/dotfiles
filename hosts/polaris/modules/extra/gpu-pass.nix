{
  nice.extra = {
    # NOTE: This isn't safe at all, and will break if you disable kernel module loading
    gpu-pass = {
      enable = true;
      devices = ["pci_0000_06_00_0" "pci_0000_06_00_1" "pci_0000_06_00_2" "pci_0000_06_00_3"];
      guest = "Windows";

      optimize = {
        enable = true;
        host = "0";
        topography = "0-5";
      };
    };
  };
}

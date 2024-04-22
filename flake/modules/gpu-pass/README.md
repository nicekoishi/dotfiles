<p align="center">
    flake/modules/gpu-pass
</p>

## Disclaimer
The shell script I use here is made by [Gerg-L](https://github.com/Gerg-L/nixos)

## How to use

### To import it and make it available in your configuration:

```nix
# flake.nix
    inputs.nicekoishi-dots = {
        url = "github:nicekoishi/dotfiles";
        inputs.nixpkgs.follows = "nixpkgs"
    };
...

# configuration.nix
{inputs, ...}: {
    imports = [
        inputs.nicekoishi-dots.nixosModules.gpu-pass
    ];
}
```

### Configuration options

```nix
    # configuration.nix
    virtualisation.libvirtd.gpu-pass = {
        enable = true;
        devices = ["pci_0000_06_00_0" "pci_0000_06_00_1" "pci_0000_06_00_2" "pci_0000_06_00_3"];
        guest = "Windows";

        optimize = {
            enable = true;
            host = "0";
            topography = "0-5";
        };
    };
```

 - Devices: Here, we pass the PCI Bus ID of the device we want to pass through.
  To get it, we can use both `lspci -k` or `virsh nodedev-list --tree` and to use
  it in the module, pass it like this: `pci_0000_01_00_1`. Where:
    - `0000` is the PCI domain
    - `01` is the bus number
    - `00` is the device within the bus
    - `1` is the function number for multi-functions devices. In the case of your GPU, 
    the card itself and its USB and audio functions. You should pass the entire IOMMU group.
  
  - Guest: Here, we pass the name of our guest. In the example above, the hook will only work 
  with the guest `Windows`. The default value here is `win10`

  - Optimize: By dynamically allocating CPUs to your host and guest, we can avoid 
  concurrency between the host and guest schedulers.<br>
  *TLDR: should make your guest lag less.*<br>
  <br>As I didn't want to assume default configurations, I choose this approach. 
  To get the correct data for your CPU, you can use `lscpu -e` to get all your available cores.<br>
  <br>More info about this is available in the [Arch Wiki](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Dynamically_isolating_CPUs)
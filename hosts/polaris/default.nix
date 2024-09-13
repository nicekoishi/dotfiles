{pkgs, ...}: {
  imports = [
    ./fs
    ./modules

    ./networking.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["nvidia"];

    system.kernel = pkgs.linuxPackages_cachyos;
    opts.waylandReady = true;
  };

  environment.systemPackages = [pkgs.scx];
}

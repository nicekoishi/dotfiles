{pkgs, ...}: {
  imports = [
    ./fs
    ./modules

    ./networking.nix
  ];

  nice.modules = {
    host = {
      cpu = "amd";
      gpu = ["nvidia"];
      waylandReady = true;

      kernel = pkgs.linuxPackages_cachyos;
    };
  };

  environment.systemPackages = [pkgs.scx];
}

{pkgs, ...}: {
  imports = [
    ./gaming
    ./convenience

    ./jellyfin.nix
    ./security.nix
    ./shared.nix
    ./rclone.nix
    ./virt-manager.nix
    ./xdg.nix
  ];

  environment.systemPackages = [
    pkgs.git
  ];
}

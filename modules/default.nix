<<<<<<< HEAD
{
=======
{pkgs, ...}: {
>>>>>>> 12c72a1 (too lazy to separate them all)
  imports = [
    ./gaming

    ./convenience.nix
    ./jellyfin.nix
<<<<<<< HEAD
    ./libvirt
    ./security.nix
    ./shared.nix
    ./virtualisation.nix
    ./xdg.nix
  ];
=======
    ./security.nix
    ./shared.nix
    ./virt-manager.nix
    ./xdg.nix
  ];

  environment.systemPackages = [
    pkgs.git
  ];
>>>>>>> 12c72a1 (too lazy to separate them all)
}

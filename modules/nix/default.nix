{pkgs, ...}: {
  imports = [./substituters.nix];
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    builders-use-substitutes = true;
    auto-optimise-store = true;
    keep-going = true;
    warn-dirty = false;
    max-jobs = "auto";
    http-connections = 0;

    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [pkgs.git];
}

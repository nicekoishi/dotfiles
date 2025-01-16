# Piper, the app I use to configure my G203, needs ratbagd to be running
{pkgs, ...}: {
  services.ratbagd = {
    enable = true;
    package = pkgs.libratbag;
  };

  environment.systemPackages = [pkgs.piper];
}

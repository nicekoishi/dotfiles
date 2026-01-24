# Piper, the app I use to configure my G203, needs ratbagd to be running
{
  config,
  pkgs,
  ...
}: let
  inherit (config.nice.host.opts) roles;
in {
  services.ratbagd = {
    enable = builtins.elem "desktop" roles;
    package = pkgs.libratbag;
  };

  environment.systemPackages =
    []
    ++ (
      if builtins.elem "desktop" roles
      then [pkgs.piper]
      else []
    );
}

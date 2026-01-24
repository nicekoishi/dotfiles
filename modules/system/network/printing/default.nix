{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in
  mkIf (builtins.elem "desktop" roles) {
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      printing = {
        enable = true;
        drivers = with pkgs; [
          #hplip
        ];
      };
    };

    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        #hplip
      ];
    };
  }

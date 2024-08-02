{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;

  cfg = config.nice.host;
in {
  config = mkIf (elem "desktop" cfg.roles) {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        verbatimConfig = ''
          user = "supeen"
          group = "users"
          namespaces = []
        '';
      };
    };

    programs.virt-manager.enable = true;
    environment.systemPackages = [pkgs.virtiofsd];
  };
}

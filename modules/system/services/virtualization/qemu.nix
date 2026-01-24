{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
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

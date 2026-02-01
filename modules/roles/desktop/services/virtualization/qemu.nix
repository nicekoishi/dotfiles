{pkgs, ...}: {
  config = {
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

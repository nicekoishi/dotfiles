{pkgs, ...}: {
  imports = [
    ../home/samba/shares.nix
  ];
  services.samba = {
    enable = true;
    package = pkgs.samba4Full;
    nsswins = true;
    securityType = "user";
    extraConfig = "
      workgroup = WORKGROUP
      server role = standalone server
      usershare allow guests = yes
      server string = polaris
      netbios name = Polaris
      guest account = nobody
      hosts allow = 192.168. localhost
      hosts deny = 0.0.0.0/0
      map to guest = bad user
    ";
  };
  services.samba-wsdd.enable = true;
}

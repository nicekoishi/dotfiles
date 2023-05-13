{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-share.nix
  ];
  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = "
      workgroup = WORKGROUP
      server string = NixOS
      netbios name = NixOS
      security = user
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    ";
  };
}

{ config, lib, pkgs, ... }:

{
  services.samba = {
    shares = {
      public = {
        path = "/home/nicekoishi/Share";
        comment = "Sharing useful stuff at ~/Share";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "force user" = "nicekoishi";
        "force group" = "nicekoishi";
      };
    };
  };
}

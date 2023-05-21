{
  services.samba = {
    shares = {
      casa = {
        path = "/home/nicekoishi/Share";
        comment = "Sharing useful stuff at ~/Share";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "public" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nicekoishi";
        "force group" = "wheel";
      };
    };
  };
}

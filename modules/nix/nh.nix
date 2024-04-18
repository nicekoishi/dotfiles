{
  environment.variables.FLAKE = "/home/supeen/Documents/code/dots";

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}

{
  environment.variables.FLAKE = "/home/supeen/Documents/code/dots";

  programs.nh = {
    enable = true;
    clean = {
      enable = false;
      dates = "weekly";
    };
  };
}

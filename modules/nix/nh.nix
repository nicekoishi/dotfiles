{inputs, ...}: {
  imports = [inputs.nh.nixosModules.default];

  environment.variables.FLAKE = "/home/supeen/Documents/code/dots";

  nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}

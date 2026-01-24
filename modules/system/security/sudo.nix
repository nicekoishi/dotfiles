{lib, ...}: let
  inherit (lib.modules) mkForce;
in {
  security = {
    sudo = {
      # only members of wheel group can execute sudo
      execWheelOnly = mkForce true;

      # interesting stuff
      extraConfig = ''
        Defaults lecture = never # I know, but it will never stop me from breaking the system again
        Defaults pwfeedback # visible password
        Defaults env_keep += "EDITOR PATH DISPLAY" # variables passed to the root account
        Defaults timestamp_timeout = 60 # it should be 1 hour, right?
      '';

      # it is possible to make rebuilds without password, but i need time to
      # know if i didn't make a mistake
    };
  };
}

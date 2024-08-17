{
  security.pam.services = let
    gpgKeyring = {
      enableGnomeKeyring = true;
      gnupg = {
        enable = true;
        noAutostart = true;
        storeOnly = true;
      };
    };
  in {
    login = {} // gpgKeyring;
    greetd = {} // gpgKeyring;
  };
}

{pkgs, ...}: {
  # FIXME: this is here until i can fully migrate to chromium
  home.packages = [pkgs.brave];
}

{pkgs, ...}: {
  # stupid resolve doesn't work with novideo
  # i can still use it on windows though, but kdenlive can do the trick
  home.packages = with pkgs; [
    libsForQt5.kdenlive
    #glaxnimate # dep for kdenlive, don't wanna override
  ];
}

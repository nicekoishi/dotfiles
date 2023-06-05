{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # i find this better for now, if there is a need
    # you should use a dev shell i guess?
    rustup

    clang
    cmake

    # FIXME: flutter not detecting android-tools,
    # even with sdk installed
    android-tools
    flutter
  ];
}

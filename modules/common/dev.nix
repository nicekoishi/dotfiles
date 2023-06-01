{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # FIXME wrong approach, it works for now though
    rustup

    clang
    cmake

    # moved to a flake, because android studio is a b
    android-tools
    flutter
  ];
}

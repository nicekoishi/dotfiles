{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # dev
    cargo
    rust-analyzer
    rustc
    rustfmt

    clang
    cmake

    # moved to a flake, because android studio is a b
    android-tools
    flutter
  ];
}

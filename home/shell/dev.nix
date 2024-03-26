{pkgs, ...}: {
  home.packages = with pkgs; [
    # i find this better for now, if there is a need
    # you should use a dev shell i guess?
    rustup

    # emacs kinda needs this, treesitter is annoying
    clang_16
    clang-tools_16

    # FIXME: flutter not detecting android-tools,
    # even with sdk installed
    android-tools
    flutter

    # ags and eslint_d
    nodejs
  ];
}

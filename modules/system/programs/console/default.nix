{pkgs, ...}: {
  imports = [
    ./zsh.nix
  ];

  console = {
    earlySetup = true;
    keyMap = "br-abnt2";
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24b.psf.gz";
    packages = [pkgs.terminus_font];
  };
}

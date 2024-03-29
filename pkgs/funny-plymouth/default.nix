{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "funny-plymouth";
  version = "init";

  src = ./.;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/plymouth
    cp -r themes $out/share/plymouth/

    cat themes/funny-plymouth/funny-plymouth.plymouth | sed "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/funny-plymouth/funny-plymouth.plymouth
  '';

  meta = with lib; {
    description = "Plymouth theme experiment";
    homepage = "https://github.com/nicekoishi/funny-plymouth";
    license = licenses.gpl3;
    maintainers = with maintainers; [nicekoishi];
    platforms = platforms.linux;
  };
}

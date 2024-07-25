{
  stdenv,
  fetchFromGitHub,
  lib,
  pnpm_9,
  nodejs,
  buildWebExtension ? false,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "suncord";
  version = "1.10.3";

  src = fetchFromGitHub {
    owner = "verticalsync";
    repo = "Suncord";
    rev = "8a176c8d051424525973b828d0b9ddc78552f640";
    hash = "sha256-8QiVbnQJKmRwwSPK9Bc65LlGPh1S1lGDy2JLT7s9NjE=";
  };

  strictDeps = true;
  dontStrip = true;

  pnpmDeps = pnpm_9.fetchDeps {
    inherit
      (finalAttrs)
      pname
      version
      src
      ;
    hash = "sha256-QkXxQtCa8HX9G6M+Hgu6EEY1ZCyShiUWS0s8zKbMq98=";
  };

  SUNCORD_HASH = finalAttrs.src.rev;
  SUNCORD_REMOTE = "${finalAttrs.src.owner}/${finalAttrs.src.repo}";

  nativeBuildInputs = [
    nodejs
    pnpm_9.configHook
  ];

  buildPhase = ''
    runHook preBuild

    pnpm ${
      if buildWebExtension
      then "buildWeb"
      else "build"
    } \
    --standalone \
    --disable-updater \
    --legacy-peer-deps

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    ${
      if buildWebExtension
      then ''
        cp -r dist/chromium-unpacked $out
      ''
      else ''
        cp -r dist/ $out
      ''
    }
    runHook postInstall
  '';

  meta = {
    description = "A fork of Vencord";
    homepage = "https://github.com/verticalsync/Suncord";
    license = lib.licenses.gpl3Only;
    platforms = nodejs.meta.platforms;
  };
})

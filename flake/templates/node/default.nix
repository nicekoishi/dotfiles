{
  buildNpmPackage,
  lib,
}:
buildNpmPackage {
  pname = "node-template";
  version = "0.0.1";

  src = ./.;

  npmDepsHash = lib.fakeHash;
}

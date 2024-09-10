{
  lib,
  flutter322,
  targetFlutterPlatform ? "linux",
}: let
  flutter = flutter322;
in
  flutter.buildFlutterApplication {
    pname = "flutter-template-${targetFlutterPlatform}";
    version = "0.0.1";

    src = ./.;
    inherit targetFlutterPlatform;

    pubspecLock = lib.importJSON ./pubspec.lock.json;
  }

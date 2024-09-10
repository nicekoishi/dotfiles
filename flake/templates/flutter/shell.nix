{
  androidenv,
  callPackage,
  cmake,
  chromium,
  gradle,
  jdk17,
  yq,
}: let
  main = callPackage ./default.nix {};

  buildToolsVersionForAapt2 = "34.0.0-rc4";

  # gradle tries to download whatever is missing, but it obviously fails as
  # it can't write to the nix store
  # write error -> add missing package
  androidComposition = androidenv.composeAndroidPackages {
    buildToolsVersions = [buildToolsVersionForAapt2 "30.0.3"];
    platformVersions = ["34" "33" "31" "30"];
    abiVersions = ["armeabi-v7a" "arm64-v8a" "x86" "x86_64"];
    includeEmulator = true;
    emulatorVersion = "34.2.11";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.1";
    includeSources = false;
    includeSystemImages = false;
    systemImageTypes = ["google_apis_playstore"];
    includeNDK = true;
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    extraLicenses = [
      "android-googletv-license"
      "android-sdk-arm-dbt-license"
      "android-sdk-license"
      "android-sdk-preview-license"
      "google-gdk-license"
      "intel-android-extra-license"
      "intel-android-sysimage-license"
      "mips-android-sysimage-license"
    ];
  };

  sdk = androidComposition.androidsdk;
in
  # https://github.com/NixOS/nixpkgs/blob/372f90788b6baeaba371edb5b784aefbb5ddf13e/doc/languages-frameworks/dart.section.md?plain=1#L138
  main.multiShell.overrideAttrs (prev: {
    env = {
      ANDROID_AVD_HOME = "${builtins.getEnv "PWD"}/.android/avd";
      ANDROID_SDK_ROOT = "${sdk}/libexec/android-sdk";
      ANDROID_NDK_ROOT = "${sdk}/libexec/android-sdk/ndk-bundle";
      ANDROID_HOME = "${sdk}/libexec/android-sdk";
      CHROME_EXECUTABLE = "${chromium}/bin/chromium";
      GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${sdk}/libexec/android-sdk/build-tools/${buildToolsVersionForAapt2}/aapt2";
    };

    nativeBuildInputs =
      [
        sdk

        cmake
        jdk17
        gradle
        yq

        # https://github.com/flutter/flutter/issues/47872
        # this will create a new profile whenever chromium is launched this way
        # is this bad?
        (chromium.override {
          commandLineArgs = "--user-data-dir=$(mktemp -d)";
        })
      ]
      ++ (prev.nativeBuildInputs or []);

    # haha, pubseggs how funny
    # too much zenless brainrot for today I suppose
    shellHook = ''
      yq . pubspec.lock > pubspec.lock.json
    '';
  })

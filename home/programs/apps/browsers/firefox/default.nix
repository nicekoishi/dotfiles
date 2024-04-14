{
  pkgs,
  lib,
  ...
}: let
  # for a time i thought: oh, n3oney probably wrote this for his firefox and it wouldn't work with mine
  # then i found it is from nur
  # i may be stupid
  buildFirefoxXpiAddon = lib.makeOverridable ({
    stdenv ? pkgs.stdenv,
    fetchurl ? pkgs.fetchurl,
    pname,
    addonId,
    sha256,
    url,
    ...
  }:
    stdenv.mkDerivation {
      name = "${pname}";
      version = "latest";
      src = fetchurl {inherit url sha256;};
      preferLocalBuild = true;
      allowSubstitutes = true;
      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    });
  # this is cursed
  addons = {
    "auto-tab-discard" = buildFirefoxXpiAddon rec {
      pname = "auto-tab-discard";
      addonId = "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "1mdmf1pp96q3rbxqqysgbsixfap5dc9df1x5i662ai640f39prc9";
    };
    "bitwarden" = buildFirefoxXpiAddon rec {
      pname = "bitwarden-password-manager";
      addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "0465bz5yf4ydxy3np24d60xa8zg9b7w1rcz7q30q4xxc2k0bqpf5";
    };
    "catppuccin" = buildFirefoxXpiAddon rec {
      pname = "catppuccin";
      addonId = "{e554e180-24a4-40a2-911d-bf48d5b1629c}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "1y11a4sjiiy8rcbg359l64vzjy3yxiagzc7isml2x96gqhv9av6n";
    };
    "clearurls" = buildFirefoxXpiAddon rec {
      pname = "clearurls";
      addonId = "{74145f27-f039-47ce-a470-a662b129930a}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "14b221pw7k4vyicrnrx91bh9zna0qm1dnk6ys0xbmf5i7kb6h0g2";
    };
    "libredirect" = buildFirefoxXpiAddon rec {
      pname = "libredirect";
      addonId = "7esoorv3@alefvanoon.anonaddy.me";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "0lc31f1yaxm1qqgdv528sbizbxbdg56m3w8pp31j1bzp4b1b28xc";
    };
    "localcdn" = buildFirefoxXpiAddon rec {
      pname = "localcdn-fork-of-decentraleyes";
      addonId = "{b86e4813-687a-43e6-ab65-0bde4ab75758}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "1i498cmp2qg34ikr7nyd7zxx6c1d5b3k8j5rhkcx7qjcg1chdcq6";
    };
    "refined-github" = buildFirefoxXpiAddon rec {
      pname = "refined-github-";
      addonId = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "111jgxvy5q8icwdmxn60hcz081bwkq67n5j7zxvggy4iv7bq5g3v";
    };
    "sponsorblock" = buildFirefoxXpiAddon rec {
      pname = "sponsorblock";
      addonId = "sponsorBlocker@ajay.app";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "0n0gv0wxq3vhkasdmarhi1w5ir1ssrffrjk6d7gc6xakr8w4ksm4";
    };
    "stylus" = buildFirefoxXpiAddon rec {
      pname = "stylus";
      addonId = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "1d8k8d6072j85zmxpgicdkx87n05dc54bs2llqskdzkxl9fm7zfi";
    };
    "ublock-origin" = buildFirefoxXpiAddon rec {
      pname = "ublock-origin";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/latest/${pname}/latest.xpi";
      sha256 = "12gbs882ynpd27bi1swl1mk2g96pqychdnqz4gx7rkyfaadffa4r";
    };
  };
in {
  imports = [./policies.nix];
  programs.firefox = {
    enable = true;
    profiles.supeen = {
      isDefault = true;
      settings = {
        "middlemouse.paste" = false;
      };
      extensions = with addons; [
        auto-tab-discard
        bitwarden
        catppuccin
        clearurls
        libredirect
        localcdn
        refined-github
        sponsorblock
        stylus
        ublock-origin
      ];
    };
  };
}

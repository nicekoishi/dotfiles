{pkgs, ...}: let
  langs = builtins.concatStringsSep "+" [
    "eng"
    "chi_sim"
    "chi_sim_vert"
    "chi_tra"
    "chi_tra_vert"
    "fra"
    "jpn"
    "jpn_vert"
    "kor"
    "kor_vert"
    "rus"
    "spa"
  ];
in {
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard

    (pkgs.writeShellApplication {
      name = "ocr";
      runtimeInputs = with pkgs; [tesseract5 grim slurp libnotify];
      text = ''
        grim -g "$(slurp -w 0 -b eebebed2)" -t ppm - | tesseract -l ${langs} - - | wl-copy
        echo "arrived here"
        notify-send -i "document-save-symbolic" "Copied to clipboard\!" "$(wl-paste)"
      '';
    })
  ];
}

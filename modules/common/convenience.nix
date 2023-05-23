{ config, pkgs, inputs,... }:
{
  # FIXME: fix this mess for the love of god;
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "printd" ''
      normal() {
        grim $XDG_PICTURES_DIR/Screenshots/"$(date +%Y-%m-%d-%H:%M:%S).png"
      }
      slurp() {
       grim -g "$(slurp)" $XDG_PICTURES_DIR/Screenshots/"$(date +%Y-%m-%d-%H:%M:%S).png"
      }
      while true; do
        case "$1"
          in
          normal) normal; shift;;
          slurp) slurp; shift;;
          *) break;;
        esac
      done
    '')
  ];
}

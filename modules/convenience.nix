{pkgs, ...}: {
  # TODO: Delete this cursed creation and spread the holy wallpapers
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "v2" ''
      YDOSTATE=false

      click () {
      YDOSTATE=true
        if [ $1 == "left" ]; then
          while $YDOTOOL;do
            ydotool click 0xC0
            # infinite recursion?
            v2 left
          done
        else
          while $YDOTOOL;do
            ydotool click 0xC1
            # again!
            v2 right
          done
        fi
      }

      if [ $# == 0 ]; then
         echo "pls parameter"
      fi

      while [ $# -gt 0 ]; do
        key="$1"
        case $key in
          left) click $1; shift ;;
          right) click $1; shift ;;
          * ) echo "dumb asf"; break ;;
        esac
      done
    '')
  ];
}

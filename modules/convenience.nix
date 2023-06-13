{pkgs, ...}: {
  # FIXME: fix this mess for the love of god;
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "walld" ''

      export SWWW_TRANSITION="any"
      export SWWW_TRANSITION_FPS=60
      export SWWW_TRANSITION_BEZIER="0,2.08,0.89,1.01"

      doit="Hey mister, do you wanna provide a directory?"
      again="Hey mister, this place does not exists:"
      thanks="insert quote from last page of hey mister here"

      echo "Hey mister, do you wanna *bonk*" | tee >(systemd-cat -p warning)

      start-random () {
        dir="$1"
        local interval=300 # 5 min if i forget
        prev=""
        new=""

        running="true"

        # recursion hell, send help
        while [ "$running" = "true" ]; do
          while [ "$new" = "$prev" ]; do
            new=$(fd . $dir | shuf -n 1) # you can also do find $dir -maxdepth 1 -type f
          done

          echo "I'm currently showing this wallpaper: $new"

          swww img $new
          prev=$new

          # so i can change the wallpaper without having to stop another instance of this script
          if [ "$running" = false ]; then
            break
          fi

          sleep $interval
        done
      }

      change-random () {
        dir="$1"
        stop
        if [ $# -eq 0 ]; then
          echo "$doit"
          exit 1
        elif [ ! -d "$dir" ]; then
          echo -e "$again \n$dir"
          return 1
        else
          start-random "$dir"
        fi
           }

      stop () {
        running="false"
        for pid in $(pgrep -f $0); do
          if [ $pid != $$ ]; then
            kill $pid
            echo "$thanks"
          fi
        done
      }

      while [ $# -gt 0 ]; do
        key="$1"
        case $key in
          init)
            if [ $# -gt 1 ]; then
              path="$2"
              change-random "$path"
              shift 2
            else
              change-random
            fi ;;
          stop) stop; shift ;;
          * ) break ;;
        esac
      done
    '')
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

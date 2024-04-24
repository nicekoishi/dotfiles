{pkgs, ...}: {
  environment.systemPackages = [pkgs.rclone];
  systemd.services = {
    # TODO: Find a way to refer to username, should I store it
    # in a var or is there a fancier way?
    # also enable will fail if remote doesn't exist '-'
    rclone-gdrive = let
      gdrive = "/home/supeen/Documents/Drive";
      notification = ''
        -t 5000 \
        -i "dialog-warning" \
        -u normal \
        "Failed to mount" "<i>rclone reconnect"</i> should fix it
      '';
      flags = ''
        --allow-other \
        --dir-cache-time 72h \
        --drive-chunk-size 512M \
        --vfs-cache-mode full \
        --vfs-read-chunk-size 512M \
        --vfs-read-chunk-size-limit off \
        --buffer-size 1G \
        --stats 1m \
        --retries-sleep 60m \
        --log-level INFO
      '';
    in {
      enable = true;
      description = "RClone Google Drive Service";
      wants = ["network-online.target"];
      after = ["network-online.target"];
      wantedBy = ["multi-user.target"];
      postStop = "${pkgs.libnotify}/bin/notify-send \ ${notification}";
      serviceConfig = {
        Type = "simple";
        Environment = "RCLONE_CONFIG=/home/supeen/.config/rclone/rclone.conf";
        Restart = "on-failure";
        RestartSec = 10;
        ExecStart = "${pkgs.rclone}/bin/rclone mount gdrive: ${gdrive} \ ${flags}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -uz ${gdrive}";
      };
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) toString;
  inherit (config.services) tailscale;
  inherit (lib.meta) getExe;
in {
  # https://tailscale.com/blog/nixos-minecraft
  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    # make sure tailscale is running before trying to connect to tailscale
    after = ["network-pre.target" "tailscale.service"];
    wants = ["network-pre.target" "tailscale.service"];
    wantedBy = ["multi-user.target"];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = ''
      # wait for tailscaled to settle
      sleep 2

      # check if we are already authenticated to tailscale
      status="$(${getExe tailscale.package} status -json | ${getExe pkgs.jq} -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      ${getExe tailscale.package} up ${toString tailscale.extraUpFlags}
    '';
  };
}

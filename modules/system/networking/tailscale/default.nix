{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkDefault;
in {
  imports = [
    ./autoconnect.nix
  ];

  boot.kernel.sysctl = {
    # https://tailscale.com/kb/1408/quick-guide-exit-nodes
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = mkDefault "both";
    extraUpFlags = [
      "--ssh"
      "--authkey file:${config.age.secrets.tailscale-key.path}"
      "--advertise-exit-node"
    ];
  };

  networking.firewall = {
    trustedInterfaces = ["tailscale0"];
    checkReversePath = "loose";
  };

  systemd.services.tailscaled = {
    after = ["network-online.target" "systemd-resolved.service"];
    wants = ["network-online.target" "systemd-resolved.service"];
  };
}

# # notashelf/nyx
{
  users.groups.audio = {};

  security.pam.loginLimits = [
    {
      domain = "@audio";
      type = "-";
      item = "rtprio";
      value = 99;
    }
    {
      domain = "@audio";
      type = "-";
      item = "memlock";
      value = "unlimited";
    }
    {
      domain = "@audio";
      type = "-";
      item = "nice";
      value = -11;
    }

    # okay, a quick search tells me that this is an I/O limit of some sorts
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];

  services.udev.extraRules = ''
    KERNEL=="cpu_dma_latency", GROUP="audio"
  '';
}

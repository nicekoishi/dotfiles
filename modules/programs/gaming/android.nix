{config, ...}: {
  virtualisation.waydroid.enable = true;

  environment.systemPackages = [
    config.nur.repos.ataraxiasjel.waydroid-script
  ];
}

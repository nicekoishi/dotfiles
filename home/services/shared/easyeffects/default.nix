{
  services.easyeffects = {
    enable = true;
    preset = "louder";
  };

  xdg.configFile."easyeffects/output/louder.json".source = ./louder.json;
}

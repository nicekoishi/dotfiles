{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hypridle.packages.${pkgs.system}.default
  ];

  # TODO: dpms only for now, hyprlock later
  services.hypridle = {
    enable = true;

    listeners = [
      {
        timeout = 300;
        onTimeout = "hyprctl dispatch dpms off";
      }
    ];
  };
}

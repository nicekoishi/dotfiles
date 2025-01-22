{
  inputs,
  inputs',
  osConfig,
  ...
}: let
  inherit (inputs') anyrun anyrun-nixos-options;
in {
  imports = [inputs.anyrun.homeManagerModules.default];
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with anyrun.packages; [
        uwsm_app

        # Monitor options on the fly, will not use it for now
        # randr # broken as of 07/05/2024

        rink
        shell
        stdin
        symbols
        translate

        anyrun-nixos-options.packages.anyrun-nixos-options
      ];

      width.fraction = 0.3;
      y.fraction = 0.02;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      hideIcons = false;
      maxEntries = 10;
    };

    extraConfigFiles = {
      "uwsm_app.ron".text = ''
        Config(
          desktop_actions: true,
          max_entries: 10,
        )
      '';
      "randr.ron".text = ''
        Config(
          prefix: ":ra",
          max_entries: 5,
        )
      '';
      "translate.ron".text = ''
        Config(
          prefix: ":pt",
          language_delimiter ">",
          max_entries: 3,
        )
      '';
      "nixos-options.ron".text = let
        nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
        hm-options = inputs'.home-manager.packages.docs-json + "/share/doc/home-manager/options.json";
        options = builtins.toJSON {
          ":nix" = [nixos-options];
          ":home" = [hm-options];
        };
      in ''
        Config(
          options: ${options},
          min_score: 5,
          max_entries: Some(4),
        )
      '';
    };

    extraCss = ''
      * {
         all: unset;
         font-family: "Iosevka Nerd Font";
         font-size: 0.9rem;
       }

       #window,
       #match,
       #entry,
       #plugin,
       #main {
         background: transparent;
       }

       #match:selected {
         background: rgba(137, 180, 250, 0.5);
       }

       #match {
         padding: 3px;
         border-radius: 16px;
       }

       #entry, #plugin:hover {
         border-radius: 16px;
       }

       box#main {
         background: rgba(30, 30, 46, 0.7);
         border: 1px solid rgb(137, 180, 250);
         border-radius: 8px;
         padding: 8px;
       }
    '';
  };
}

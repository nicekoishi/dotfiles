{
  inputs,
  pkgs,
  osConfig,
  ...
}: let
  inherit (inputs) anyrun anyrun-nixos-options;
in {
  imports = [anyrun.homeManagerModules.default];
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with anyrun.packages.${pkgs.system}; [
        applications
        #randr # broken as of 07/05/2024
        rink
        shell
        stdin
        symbols
        translate

        anyrun-nixos-options.packages.${pkgs.system}.default
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
      "applications.ron".text = ''
        Config(
          desktop_actions: true,
          max_entries: 10,
          terminal: Some("footclient"),
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
        hm-options = inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";
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
         transition: 200ms width 200ms height;
         font-family: "Iosevka Nerd Font";
         font-size: 0.67rem;
       }

       #window,
       #match,
       #entry,
       #plugin,
       #main {
         background: transparent;
       }

       #match:selected {
         background: rgba(148, 226, 213, 0.5);
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
         border: 1px solid rgba(40, 40, 61, 0.1);
         border-radius: 8px;
         padding: 8px;
       }
    '';
  };
}

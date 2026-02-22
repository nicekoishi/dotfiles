{inputs', ...}: let
  inherit (inputs') anyrun;
in {
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with anyrun.packages; [
        applications
        nix-run
        rink
        shell
        stdin
        symbols
        translate
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
    };

    extraCss = ''
      * {
         all: unset;
         font-family: "Iosevka Nerd Font";
         font-size: 0.9rem;
       }

       window,
       .match,
       .matches,
       list.plugin,
       box.main {
         background: transparent;
       }

       .match:selected {
         background: rgba(137, 180, 250, 0.5);
       }

       .match {
         padding: 3px;
         border-radius: 16px;
       }

       .matches, box.plugin:hover {
         border-radius: 16px;
       }

       box.main {
         background: rgba(30, 30, 46, 0.7);
         border: 1px solid rgb(137, 180, 250);
         border-radius: 8px;
         padding: 8px;
       }
    '';
  };
}

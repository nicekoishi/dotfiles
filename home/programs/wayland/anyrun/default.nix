{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) anyrun;
in {
  imports = [anyrun.homeManagerModules.default];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        stdin
        translate
      ];
      closeOnClick = true;
      hideIcons = false;
      hidePluginInfo = true;
      maxEntries = 5;
      width.fraction = 0.3;
      y.absolute = 9;
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

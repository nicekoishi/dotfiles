# https://mozilla.github.io/policy-templates/#extensionsettings
let
  extensions = [
    {
      id = "uBlock0@raymondhill.net";
      name = "ublock-origin";
    }
    {
      id = "FirefoxColor@mozilla.com";
      name = "firefox-color";
    }
    {
      id = "enhancerforyoutube@maximerf.addons.mozilla.org";
      name = "enhancer-for-youtube";
    }
    {
      id = "firefox@betterttv.net";
      name = "betterttv";
    }
    {
      id = "sponsorBlocker@ajay.app";
      name = "sponsorblock";
    }
    #{
    #  id = "{3c078156-979c-498b-8990-85f7987dd929}";
    #  name = "sidebery";
    #}
    {
      id = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
      name = "bitwarden-password-manager";
    }
    {
      id = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
      name = "styl-us";
    }
  ];
  mapExtensions = builtins.listToAttrs (map (extension: {
      name = extension.id;
      value = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${extension.name}/latest.xpi";
      };
    })
    extensions);
in
  mapExtensions

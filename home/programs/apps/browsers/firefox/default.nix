{
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib.attrsets) optionalAttrs;

  nvidiaGpu = builtins.elem "nvidia" osConfig.services.xserver.videoDrivers;
in {
  imports = [./settings];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        OverrideFirstRunPage = "";
        AppAutoUpdate = false;
        # i.e public wifi login, should this be set by an option instead?
        CaptivePortal = false;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisplatBookmarksToolbar = "always";
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        PassworkManagerEnabled = false;
        PromptForDownloadLocation = true;

        Cookies = {
          Behavior = "accept";
          Locked = false;
        };

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          EmailTracking = true;
          Fingerprinting = true;
        };

        ExtensionSettings = import ./extensions;

        # if ..Pocket is false, why isn't Sponsored.. not false too?
        FirefoxHome = {
          Search = true;
          Highlights = false;
          Pocket = false;
          Snippets = false;
          SponsoredPocket = false;
          SponsoredTopSites = false;
          TopSites = false;
        };

        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
  };

  home.sessionVariables =
    {
      MOZ_ENABLE_WAYLAND = 1;
      MOZ_DBUS_REMOTE = 1;
    }
    # as I don't know if amd gpus need this, let's enable for nvidia only
    // optionalAttrs nvidiaGpu {MOZ_DISABLE_RDD_SANDBOX = 1;};
}

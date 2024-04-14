{pkgs, ...}: {
  programs.firefox = {
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        AppAutoUpdate = false;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        OverrideFirstRunPage = "";

        DisplayBookmarksToolbar = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
        PromptForDownloadLocation = true;

        Cookies = {
          Behaviour = "accept";
          ExpireAtSessionEnd = false;
          Locked = false;
        };

        EnableTrackingProtection = {
          Cryptomining = true;
          Fingerprinting = true;
          Locked = true;
          Value = true;
        };

        FirefoxHome = {
          Highlights = false;
          Pocket = false;
          Search = false;
          Snippets = false;
          SponsoredPocket = false;
          SponsoredTopSites = false;
          TopSites = false;
        };

        SearchEngines = {
          Default = "Google"; #eww
          Remove = ["Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia" "DuckDuckGo"];
        };

        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
          MoreFromMozilla = false;
        };
      };
    };
  };
}

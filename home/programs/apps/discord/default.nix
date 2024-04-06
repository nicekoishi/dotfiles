# kindly borrowed from n3oney/nixus
{
  lib,
  pkgs,
  ...
}: let
  vesktop = pkgs.vesktop.overrideAttrs (old: {
    /*
    readonly patch is needed as the dumbass tries to write on the nix store
    hell, let's do this
    refer to line 1
    */
    patches =
      old.patches or [] ++ [./readonlyFix.patch];
    postFixup = ''
      wrapProgram $out/bin/${pkgs.vesktop.meta.mainProgram or (lib.getName pkgs.vesktop)} \
        --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland --disable-gpu"
    '';
  });
in {
  home.packages = [
    vesktop
  ];

  # okay, this is really convenient
  xdg.configFile = {
    "vesktop/settings.json".text = builtins.toJSON {
      minimizeToTray = false;
      discordBranch = "canary";
      firstLaunch = false;
      arRPC = "on";
      splashColor = "rgb(205, 214, 244)";
      splashBackground = "rgb(30, 30, 46)";
      staticTitle = true;
      enableMenu = true;
      checkUpdates = false;
    };

    # i don't want to do plugins ever again
    "vesktop/settings/settings.json".text = builtins.toJSON {
      notifyAboutUpdates = false;
      autoUpdate = false;
      autoUpdateNotification = false;
      useQuickCss = true;
      themeLinks = ["https://catppuccin.github.io/discord/dist/catppuccin-mocha-teal.theme.css"];
      enabledThemes = [];
      enableReactDevtools = true;
      frameless = false;
      transparent = true;
      winCtrlQ = false;
      disableMinSize = false;
      winNativeTitleBar = false;

      plugins = {
        "WebRichPresence (arRPC)".enabled = false;
        AlwaysAnimate.enabled = true;
        BadgeAPI.enabled = true;
        BetterGifAltText.enabled = false;
        BetterGifPicker.enabled = false;
        BetterRoleContext.enabled = false;
        BetterUploadButton.enabled = false;
        BiggerStreamPreview.enabled = true;
        ChatInputButtonAPI.enabled = true;
        ClearURLs.enabled = false;
        ColorSighted.enabled = true;
        CommandsAPI.enabled = true;
        ConsoleShortcuts.enabled = false;
        ContextMenuAPI.enabled = true;
        CopyUserURLs.enabled = false;
        Dearrow.enabled = false;
        DisableCallIdle.enabled = false;
        EmoteCloner.enabled = false;
        F8Break.enabled = false;
        FavoriteEmojiFirst.enabled = false;
        FixCodeblockGap.enabled = false;
        FixYoutubeEmbeds.enabled = false;
        ForceOwnerCrown.enabled = false;
        FriendInvites.enabled = false;
        FriendsSince.enabled = false;
        GifPaste.enabled = false;
        HideAttachments.enabled = false;
        KeepCurrentChannel.enabled = true;
        MemberListDecoratorsAPI.enabled = true;
        MessageAccessoriesAPI.enabled = true;
        MessageDecorationsAPI.enabled = true;
        MessageEventsAPI.enabled = true;
        MessagePopoverAPI.enabled = true;
        MoreCommands.enabled = false;
        MoreKaomoji.enabled = false;
        MutualGroupDMs.enabled = false;
        NSFWGateBypass.enabled = false;
        NoDevtoolsWarning.enabled = false;
        NoF1.enabled = false;
        NoProfileThemes.enabled = false;
        NoScreensharePreview.enabled = false;
        NoTrack.enabled = true;
        NoTypingAnimation.enabled = false;
        NoUnblockToJump.enabled = false;
        NormalizeMessageLinks.enabled = true;
        NoticesAPI.enabled = true;
        PlainFolderIcon.enabled = false;
        PreviewMessage.enabled = false;
        QuickMention.enabled = false;
        ReactErrorDecoder.enabled = false;
        ReadAllNotificationsButton.enabled = true;
        RevealAllSpoilers.enabled = false;
        ReverseImageSearch.enabled = false;
        SearchReply.enabled = false;
        SecretRingToneEnabler.enabled = false;
        ServerListAPI.enabled = true;
        ServerProfile.enabled = false;
        ShowAllMessageButtons.enabled = false;
        ShowTimeouts.enabled = true;
        SpotifyShareCommands.enabled = false;
        StartupTimings.enabled = true;
        SupportHelper.enabled = true;
        TextReplace.enabled = false;
        ThemeAttributes.enabled = false;
        TimeBarAllActivities.enabled = false;
        Unindent.enabled = false;
        UnsuppressEmbeds.enabled = false;
        ValidUser.enabled = false;
        VencordToolbox.enabled = false;
        VoiceChatDoubleClick.enabled = true;
        WebKeybinds.enabled = true;
        WhoReacted.enabled = true;
        Wikisearch.enabled = false;
        iLoveSpam.enabled = false;
        oneko.enabled = false;
        petpet.enabled = false;

        AlwaysTrust = {
          enabled = false;
          domain = true;
          file = true;
        };

        AnonymiseFileNames = {
          enabled = true;
          anonymiseByDefault = true;
          method = 0;
          randomisedLength = 7;
          consistent = "image";
        };

        BANger = {
          enabled = false;
          source = "https=//i.imgur.com/wp5q52C.mp4";
        };

        BetterFolders = {
          enabled = true;
          sidebar = true;
          showFolderIcon = 1;
          closeAllHomeButton = false;
          keepIcons = true;
          sidebarAnim = true;
          closeOthers = false;
          closeAllFolders = false;
          forceOpen = false;
        };

        BetterNotesBox = {
          enabled = false;
          hide = false;
          noSpellCheck = false;
        };

        BetterRoleDot = {
          enabled = false;
          bothStyles = false;
          copyRoleColorInProfilePopout = false;
        };

        BetterSettings = {
          enabled = false;
          disableFade = true;
          eagerLoad = false;
          organizeMenu = true;
        };

        BlurNSFW = {
          enabled = false;
          blurAmount = 10;
        };

        CallTimer = {
          enabled = true;
          format = "stopwatch";
        };

        ClientTheme = {
          enabled = false;
          color = 313338;
        };

        CrashHandler = {
          enabled = true;
          attemptToPreventCrashes = true;
          attemptToNavigateToHome = false;
        };

        CustomRPC = {
          enabled = false;
          type = 1;
          timestampMode = 1;
          appID = 191919;
          appName = "abc";
          details = "def";
          state = "ghi";
        };

        Decor = {
          enabled = false;
          agreedToGuidelines = false;
        };

        Experiments = {
          enabled = false;
          enableIsStaff = false;
        };

        FakeNitro = {
          enabled = false;
          enableEmojiBypass = true;
          enableStickerBypass = true;
          enableStreamQualityBypass = true;
          transformStickers = true;
          transformEmojis = true;
          emojiSize = 48;
          stickerSize = 160;
          transformCompoundSentence = false;
          useHyperLinks = true;
          hyperLinkText = "{{NAME}}";
        };

        FakeProfileThemes = {
          enabled = false;
          nitroFirst = true;
        };

        FavoriteGifSearch = {
          enabled = false;
          searchOption = "hostandpath";
        };

        FixSpotifyEmbeds = {
          enabled = false;
          volume = 10;
        };

        GameActivityToggle = {
          enabled = true;
          oldIcon = false;
        };

        GreetStickerPicker = {
          enabled = false;
          greetMode = "Greet";
        };

        IgnoreActivities = {
          enabled = false;
          ignoredActivities = [];
          allowedIds = "";
          ignorePlaying = false;
          ignoreListening = false;
          ignoreStreaming = false;
          ignoreWatching = false;
          ignoreCompeting = false;
        };

        ImageZoom = {
          enabled = true;
          saveZoomValues = true;
          invertScroll = false;
          nearestNeighbour = false;
          square = false;
          zoom = 2;
          size = 100;
          zoomSpeed = 0.5;
        };

        InvisibleChat = {
          enabled = false;
          savedPasswords = "pass, Pass";
        };

        LastFMRichPresence = {
          enabled = false;
          hideWithSpotify = true;
          shareUsername = false;
          statusName = "some music";
          nameFormat = "status-name";
          useListeningStatus = false;
          missingArt = "lastfmLogo";
          showLastFmLogo = true;
          username = "username";
          apiKey = "apiKeySecret"; # i don't even need to say right?
        };

        LoadingQuotes = {
          enabled = true;
          replaceEvents = true;
        };

        MemberCount = {
          enabled = true;
          memberList = true;
          toolTip = true;
        };

        MessageClickActions = {
          enabled = false;
          enableDeleteOnClick = true;
          enableDoubleClickToEdit = true;
          enableDoubleClickToReply = true;
          requireModifier = false;
        };

        MessageLinkEmbeds = {
          enabled = false;
          automodEmbeds = "never";
          listMode = "blacklist";
          idList = "";
          messageBackgroundColor = false;
        };

        MessageLogger = {
          enabled = false;
          deleteStyle = "text";
          ignoreBots = false;
          ignoreSelf = false;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
          logEdits = true;
          logDeletes = true;
        };

        MessageTags = {
          enabled = false;
          clyde = true;
        };

        MoreUserTags = {
          enabled = false;
          tagSettings = {
            WEBHOOK = {
              text = "Webhook";
              showInChat = true;
              showInNotChat = true;
            };
            OWNER = {
              text = "Owner";
              showInChat = true;
              showInNotChat = true;
            };
            ADMINISTRATOR = {
              text = "Admin";
              showInChat = true;
              showInNotChat = true;
            };
            MODERATOR_STAFF = {
              text = "Staff";
              showInChat = true;
              showInNotChat = true;
            };
            MODERATOR = {
              text = "Mod";
              showInChat = true;
              showInNotChat = true;
            };
            VOICE_MODERATOR = {
              text = "VC Mod";
              showInChat = true;
              showInNotChat = true;
            };
          };
          dontShowForBots = false;
          dontShowBotTag = false;
        };

        Moyai = {
          enabled = false;
          ignoreBots = true;
          ignoreBlocked = true;
          volume = 0.5;
          quality = "Normal";
          triggerWhenUnfocused = true;
        };

        NewGuildSettings = {
          enabled = false;
          guild = true;
          everyone = true;
          role = true;
          showAllChannels = true;
        };

        NoBlockedMessages = {
          enabled = false;
          ignoreBlockedMessages = false;
        };

        NoMosaic = {
          enabled = true;
          inlineVideo = true;
          mediaLayoutType = "STATIC";
        };

        NoPendingCount = {
          enabled = false;
          hideFriendRequestsCount = true;
          hideMessageRequestsCount = true;
          hidePremiumOffersCount = true;
        };

        NoReplyMention = {
          enabled = true;
          userList = "1234567890123445,1234567890123445";
          shouldPingListed = true;
          inverseShiftReply = false;
        };

        NotificationVolume = {
          enabled = false;
          notificationVolume = 100;
        };

        OnePingPerDM = {
          enabled = false;
          channelToAffect = "both_dms";
          allowMentions = false;
          allowEveryone = false;
        };

        OpenInApp = {
          enabled = false;
          spotify = true;
          steam = true;
          epic = true;
        };

        OverrideForumDefaults = {
          enabled = false;
          defaultLayout = 1;
          defaultSortOrder = 0;
        };

        "Party mode 🎉" = {
          enabled = false;
          superIntensePartyMode = 0;
        };

        PermissionFreeWill = {
          enabled = false;
          lockout = true;
          onboarding = true;
        };

        PermissionsViewer = {
          enabled = false;
          permissionsSortOrder = 0;
          defaultPermissionsDropdownState = false;
        };

        PictureInPicture = {
          enabled = false;
          loop = true;
        };

        PinDMs = {
          enabled = false;
          dmSectioncollapsed = false;
          sortDmsByNewestMessage = false;
        };

        PlatformIndicators = {
          enabled = true;
          colorMobileIndicator = true;
          list = true;
          badges = true;
          messages = true;
        };

        PronounDB = {
          enabled = false;
          pronounsFormat = "LOWERCASE";
          pronounSource = 0;
          showSelf = true;
          showInMessages = true;
          showInProfile = true;
        };

        QuickReply = {
          enabled = true;
          shouldMention = 2;
        };

        RelationshipNotifier = {
          enabled = true;
          offlineRemovals = true;
          groups = true;
          servers = true;
          friends = true;
          friendRequestCancels = true;
          notices = true;
        };

        ResurrectHome = {
          enabled = false;
          forceServerHome = false;
        };

        ReviewDB = {
          enabled = false;
          notifyReviews = true;
          showWarning = true;
          hideTimestamps = false;
          hideBlockedUsers = true;
        };

        RoleColorEverywhere = {
          enabled = true;
          chatMentions = true;
          memberList = true;
          voiceUsers = true;
        };

        SendTimestamps = {
          enabled = true;
          replaceMessageContents = true;
        };

        ServerListIndicators = {
          enabled = false;
          mode = 2;
        };

        Settings = {
          enabled = true;
          settingsLocation = "aboveActivity";
        };

        ShikiCodeblocks = {
          enabled = false;
          useDevIcon = "GREYSCALE";
          theme = "https=//raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/dark-plus.json";
          tryHljs = "SECONDARY";
          bgOpacity = 100;
        };

        ShowConnections = {
          enabled = false;
          iconSize = 32;
          iconSpacing = 1;
        };

        ShowHiddenChannels = {
          enabled = false;
          showMode = 0;
          hideUnreads = true;
          defaultAllowedUsersAndRolesDropdownState = true;
        };

        ShowMeYourName = {
          enabled = false;
          mode = "user-nick";
          displayNames = false;
          inReplies = false;
        };

        SilentMessageToggle = {
          enabled = false;
          persistState = false;
          autoDisable = true;
        };

        SilentTyping = {
          enabled = false;
          showIcon = false;
          isEnabled = true;
        };

        SortFriendRequests = {
          enabled = false;
          showDates = true;
        };

        SpotifyControls = {
          enabled = false;
          hoverControls = false;
          useSpotifyUris = false;
        };

        SpotifyCrack = {
          enabled = false;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = false;
        };

        SuperReactionTweaks = {
          enabled = false;
          superReactByDefault = true;
          unlimitedSuperReactionPlaying = false;
          superReactionPlayingLimit = 20;
        };

        Translate = {
          enabled = false;
          autoTranslate = false;
        };

        TypingIndicator = {
          enabled = true;
          includeCurrentChannel = true;
          includeMutedChannels = false;
          includeBlockedUsers = false;
        };

        TypingTweaks = {
          enabled = true;
          alternativeFormatting = true;
          showAvatars = true;
          showRoleColors = true;
        };

        UrbanDictionary = {
          enabled = false;
          resultsAmount = 100;
        };

        UserVoiceShow = {
          enabled = false;
          showInUserProfileModal = true;
          showVoiceChannelSectionHeader = true;
        };

        USRBG = {
          enabled = false;
          voiceBackground = true;
          nitroFirst = true;
        };

        VcNarrator = {
          enabled = false;
          voice = "Afrikaans espeak-ng";
          volume = 1;
          rate = 1;
          sayOwnName = false;
          latinOnly = false;
          joinMessage = "{{USER}} joined";
          leaveMessage = "{{USER}} left";
          moveMessage = "{{USER}} moved to {{CHANNEL}}";
          muteMessage = "{{USER}} Muted";
          unmuteMessage = "{{USER}} unmuted";
          deafenMessage = "{{USER}} deafened";
          undeafenMessage = "{{USER}} undeafened";
        };

        ViewIcons = {
          enabled = false;
          format = "webp";
          imgSize = 1024;
        };

        ViewRaw = {
          enabled = false;
          clickMethod = "Left";
        };

        VoiceMessages = {
          enabled = false;
          noiseSuppression = true;
          echoCancellation = true;
        };

        WebContextMenus = {
          enabled = true;
          addBack = true;
        };

        XSOverlay = {
          enabled = false;
          ignoreBots = false;
          pingColor = "#7289da";
          channelPingColor = "#8a2be2";
          soundPath = "default";
          timeout = 1;
          opacity = 1;
          volume = 0.2;
        };
      };
      notifications = {
        timeout = 5000;
        position = "bottom-right";
        useNative = "always";
        logLimit = 50;
      };

      cloud = {
        authenticated = false;
        url = "https://api.vencord.dev/";
        settingsSync = false;
        settingsSyncVersion = 1712390951654;
      };
    };
  };
}

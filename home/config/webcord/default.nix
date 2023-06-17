{
  xdg.configFile."WebCord/Themes/theme".text = ''
    #app-mount{
      background-color: transparent;
      border-color: transparent;
    }

    body, .container-2o3qEW, .container-ZMc96U,.chat-2ZfjoI, .bg-1QIAus, .app-2CXKsg, .member-2gU6Ar, .sidebar-1tnWFu, .container-YkUktl, .scroller-WSmht3, .container-1oAagU, .scrollableContainer-15eg7h {
      background: transparent !important;
    }

    .members-3WRCEx, .container-1NXEtd, .guilds-2JjMmN, .chatContent-3KubbW, .title-31SJ6t, .panels-3wFtMD, .privateChannels-oVe7HL, .searchBar-3TnChZ, .container-2cd8Mz, .nowPlayingColumn-1eCBCN, .itemCard-3Etziu, .container-ZMc96U, .searchBar-2aylmZ, .channelTextArea-1FufC0 {
      background: #24273aB2 !important;
    }

    .form-3gdLxP::before {
      opacity: 0;
    };


    .container-1NXEtd {
      border-right: 1px solid #3d3f45;
      border-left: 1px solid #3d3f45;
    }

    /**
     * @name Catppuccin Macchiato
     * @author winston#0001
     * @authorId 505490445468696576
     * @version 0.2.0
     * @description 🎮 Soothing pastel theme for Discord
     * @website https://github.com/catppuccin/discord
     * @invite r6Mdz5dpFc
    **/
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-teal.theme.css");
    button[class*=emojiButtonNormal] > div > div {
      filter: grayscale(0.77) hue-rotate(185deg) brightness(1.03) opacity(100%) !important;
    }
    [data-popout-root],
    html {
      --brand-experiment: #8aadf4;
      --brand-experiment-100: white;
      --brand-experiment-130: white;
      --brand-experiment-160: white;
      --brand-experiment-200: white;
      --brand-experiment-230: white;
      --brand-experiment-260: white;
      --brand-experiment-300: white;
      --brand-experiment-330: white;
      --brand-experiment-360: #e7eefd;
      --brand-experiment-400: #d0defb;
      --brand-experiment-430: #b9cef8;
      --brand-experiment-460: #a1bdf6;
      --brand-experiment-500: #8aadf4;
      --brand-experiment-530: #739df2;
      --brand-experiment-560: #5b8cf0;
      --brand-experiment-600: #447ced;
      --brand-experiment-630: #2d6ceb;
      --brand-experiment-660: #165be9;
      --brand-experiment-700: #1452d1;
      --brand-experiment-730: #134ec6;
      --brand-experiment-760: #1149ba;
      --brand-experiment-800: #1045ae;
      --brand-experiment-830: #0f40a3;
      --brand-experiment-860: #0e3b97;
      --brand-experiment-900: #0d378b;
      --brand-experiment-05a: rgba(138, 173, 244, 0.05);
      --brand-experiment-10a: rgba(138, 173, 244, 0.1);
      --brand-experiment-15a: rgba(138, 173, 244, 0.15);
      --brand-experiment-20a: rgba(138, 173, 244, 0.2);
      --brand-experiment-25a: rgba(138, 173, 244, 0.25);
      --brand-experiment-30a: rgba(138, 173, 244, 0.3);
      --brand-experiment-35a: rgba(138, 173, 244, 0.35);
      --brand-experiment-40a: rgba(138, 173, 244, 0.4);
      --brand-experiment-45a: rgba(138, 173, 244, 0.45);
      --brand-experiment-50a: rgba(138, 173, 244, 0.5);
      --brand-experiment-55a: rgba(138, 173, 244, 0.55);
      --brand-experiment-60a: rgba(138, 173, 244, 0.6);
      --brand-experiment-65a: rgba(138, 173, 244, 0.65);
      --brand-experiment-70a: rgba(138, 173, 244, 0.7);
      --brand-experiment-75a: rgba(138, 173, 244, 0.75);
      --brand-experiment-80a: rgba(138, 173, 244, 0.8);
      --brand-experiment-85a: rgba(138, 173, 244, 0.85);
      --brand-experiment-90a: rgba(138, 173, 244, 0.9);
      --brand-experiment-95a: rgba(138, 173, 244, 0.95);
    }

    .theme-dark,
    .theme-light {
      --header-primary: #cad3f5;
      --header-secondary: #a5adcb;
      --text-normal: #cad3f5;
      --text-muted: #a5adcb;
      --text-link: #8aadf4;
      --text-link-low-saturation: #7dc4e4;
      --text-positive: #a6da95;
      --text-warning: #eed49f;
      --text-danger: #ed8796;
      --text-brand: #8aadf4;
      --background-primary: #24273a;
      --background-secondary: #1e2030;
      --background-secondary-alt: #1a1c2a;
      --background-tertiary: #181926;
      --background-accent: #8aadf4;
      --background-floating: #141520;
      --background-nested-floating: #1e2030;
      --background-mobile-primary: #24273a;
      --background-mobile-secondary: #1e2030;
      --chat-background: #24273a;
      --chat-border: #181926;
      --chat-input-container-background: #24273a;
      --background-modifier-hover: rgba(202, 211, 245, 0.15);
      --background-modifier-selected: rgba(202, 211, 245, 0.2);
      --background-modifier-accent: rgba(202, 211, 245, 0.26);
      --background-modifier-active: rgba(202, 211, 245, 0.17);
      --info-positive-background: rgba(166, 218, 149, 0.15);
      --info-positive-foreground: #a6da95;
      --info-positive-text: #cad3f5;
      --info-warning-background: rgba(238, 212, 159, 0.15);
      --info-warning-foreground: #eed49f;
      --info-warning-text: #cad3f5;
      --info-danger-background: rgba(237, 135, 150, 0.15);
      --info-danger-foreground: #ed8796;
      --info-danger-text: #cad3f5;
      --info-help-background: rgba(145, 215, 227, 0.15);
      --info-help-foreground: #91d7e3;
      --info-help-text: #cad3f5;
      --status-positive-background: #a6da95;
      --status-positive-text: #24273a;
      --status-warning-background: #eed49f;
      --status-warning-text: #24273a;
      --status-danger-background: #ed8796;
      --status-danger-text: #24273a;
      --status-danger: #ed8796;
      --status-positive: #a6da95;
      --status-warning: #eed49f;
      --status-yellow-400: #eed49f;
      --status-green-600: #a6da95;
      --primary-dark-600: #24273a;
      --status-yellow-560: #eed49f;
      --status-red-500: #ed8796;
      --status-red-530: #ed8796;
      --status-yellow-500: #eed49f;
      --black-500: #181926;
      --green-360: #a6da95;
      --primary-400: #b8c0e0;
      --primary-dark-700: #181926;
      --status-green-560: #a6da95;
      --white-500: #cad3f5;
      --guild-boosting-pink: #f5bde6;
      --premium-perk-yellow: #eed49f;
      --premium-perk-purple: #c6a0f6;
      --premium-perk-dark-blue: #5b8cf0;
      --premium-perk-light-blue: #a1bdf6;
      --premium-perk-blue: #8aadf4;
      --premium-perk-green: #a6da95;
      --premium-perk-pink: #f5bde6;
      --premium-perk-orange: #f5a97f;
      --status-green-400: #a6da95;
      --button-danger-background: #ed8796;
      --button-danger-background-hover: #ea7183;
      --button-danger-background-active: #6794f1;
      --button-danger-background-disabled: #ed8796;
      --button-positive-background: #a6da95;
      --button-positive-background-hover: #96d382;
      --button-positive-background-active: #8ed079;
      --button-positive-background-disabled: #a6da95;
      --button-secondary-background: #494d64;
      --button-secondary-background-hover: #3e4255;
      --button-secondary-background-active: #3e4255;
      --button-secondary-background-disabled: #494d64;
      --button-outline-danger-text: #cad3f5;
      --button-outline-danger-border: #ed8796;
      --button-outline-danger-background: transparent;
      --button-outline-danger-background-hover: #eb7c8c;
      --button-outline-danger-text-hover: #24273a;
      --button-outline-danger-border-hover: #eb7c8c;
      --button-outline-danger-background-active: #ea7183;
      --button-outline-danger-text-active: #24273a;
      --button-outline-danger-border-active: #eb7c8c;
      --button-outline-positive-text: #cad3f5;
      --button-outline-positive-border: #a6da95;
      --button-outline-positive-background: transparent;
      --button-outline-positive-background-hover: #9ed78c;
      --button-outline-positive-text-hover: #24273a;
      --button-outline-positive-border-hover: #9ed78c;
      --button-outline-positive-background-active: #96d382;
      --button-outline-positive-text-active: #24273a;
      --button-outline-positive-border-active: #9ed78c;
      --button-outline-brand-text: #cad3f5;
      --button-outline-brand-border: #8aadf4;
      --button-outline-brand-background: transparent;
      --button-outline-brand-background-hover: #7ea5f3;
      --button-outline-brand-text-hover: #24273a;
      --button-outline-brand-border-hover: #7ea5f3;
      --button-outline-brand-background-active: #739df2;
      --button-outline-brand-text-active: #24273a;
      --button-outline-brand-border-active: #7ea5f3;
      --button-outline-primary-text: #cad3f5;
      --button-outline-primary-border: #5b6078;
      --button-outline-primary-background: transparent;
      --button-outline-primary-background-hover: #565a71;
      --button-outline-primary-text-hover: #24273a;
      --button-outline-primary-border-hover: #565a71;
      --button-outline-primary-background-active: #505469;
      --button-outline-primary-text-active: #24273a;
      --button-outline-primary-border-active: #565a71;
      --modal-background: #24273a;
      --modal-footer-background: #181926;
      --scrollbar-thin-thumb: #8aadf4;
      --scrollbar-thin-track: transparent;
      --scrollbar-auto-thumb: #8aadf4;
      --scrollbar-auto-track: #181926;
      --scrollbar-auto-scrollbar-color-thumb: #8aadf4;
      --scrollbar-auto-scrollbar-color-track: #181926;
      --input-background: #181926;
      --input-placeholder-text: #b8c0e0;
      --logo-primary: #cad3f5;
      --control-brand-foreground: #8aadf4;
      --control-brand-foreground-new: #8aadf4;
      --mention-foreground: #8aadf4;
      --mention-background: rgba(138, 173, 244, 0.3);
      --background-mentioned: rgba(238, 212, 159, 0.1);
      --background-mentioned-hover: rgba(238, 212, 159, 0.08);
      --background-message-hover: rgba(24, 25, 38, 0.25);
      --background-message-automod: rgba(244, 219, 214, 0.05);
      --background-message-automod-hover: rgba(244, 219, 214, 0.1);
      --background-message-highlight: rgba(138, 173, 244, 0.1);
      --background-message-highlight-hover: rgba(138, 173, 244, 0.08);
      --channels-default: #959ec2;
      --channel-icon: #959ec2;
      --channel-text-area-placeholder: rgba(202, 211, 245, 0.5);
      --channeltextarea-background: #1e2030;
      --activity-card-background: #181926;
      --textbox-markdown-syntax: #6e738d;
      --spoiler-revealed-background: #363a4f;
      --spoiler-hidden-background: #5b6078;
      --android-navigation-bar-background: #181926;
      --android-ripple: rgba(24, 25, 38, 0.3);
      --deprecated-card-bg: rgba(24, 25, 38, 0.6);
      --deprecated-card-editable-bg: rgba(24, 25, 38, 0.3);
      --deprecated-store-bg: #24273a;
      --deprecated-quickswitcher-input-background: #505469;
      --deprecated-quickswitcher-input-placeholder: rgba(24, 25, 38, 0.3);
      --deprecated-text-input-bg: #181926;
      --deprecated-text-input-border: rgba(24, 25, 38, 0.3);
      --deprecated-text-input-border-hover: #0e0f16;
      --deprecated-text-input-border-disabled: #1e2030;
      --deprecated-text-input-prefix: #a5adcb;
      --focus-primary: #8aadf4;
      --interactive-normal: #cad3f5;
      --interactive-muted: rgba(202, 211, 245, 0.3);
      --interactive-hover: #cad3f5;
      --interactive-active: #cad3f5;
    }
    .theme-dark [class*=disabledPointerEvents],
    .theme-light [class*=disabledPointerEvents] {
      --background-floating: #363a4f;
      --background-tertiary: #2a2d43;
    }
    .theme-dark [class*=disabledPointerEvents] svg[class^=activityIcon-],
    .theme-light [class*=disabledPointerEvents] svg[class^=activityIcon-] {
      color: #a5adcb;
    }
    .theme-dark [class*=disabledPointerEvents] [class*=tooltipBrand-] [class*=tooltipText-],
    .theme-light [class*=disabledPointerEvents] [class*=tooltipBrand-] [class*=tooltipText-] {
      color: #181926;
    }

    ::selection {
      background-color: rgba(138, 173, 244, 0.6);
    }

    [class*=staffBadge-] {
      background-image: url("data:image/svg+xml,%3Csvg fill='none' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23181926'%3E%3Cpath d='m5.92127 6.03526s.22115-.33086.31286-.47743c.09172-.14657-.23743-.49286-.36514-.60257-.12772-.10971-.32914-.05486-.32914-.05486-1.60715.71229-2.41115 2.17372-2.52086 2.466-.10972.29229.27943.61115.56657.76715.132.072.342-.08743.47143-.20572l.04371-.04457.06772-.06857.00085-.00086 4.37229 4.35517.59743-.5975 1.09801-1.098-4.32173-4.43224z'/%3E%3Cpath d='m16.2505 10.6294.2306-.2194 2.0717 2.052c.0146.0129.03.018.0437.018.0395 0 .072-.036.072-.036s2.2937-2.2757 2.3015-2.2834c.0677-.0669 0-.1037 0-.1037l-1.7692-1.78119-.0026.00258-.2425-.23743.1354-.13029.2897.03343-.0548-.384.0728-.07371-.1088-.55372c-.378-.53571-1.4135-1.39371-1.4135-1.39371l-.5417-.09772-.0548.07286-.408-.06086.0394.348.0257.02572-.1209.12171-.6685-.654s-3.8795-2.10686-4.086-2.20457c-.1166-.054-.2023-.09-.2846-.09-.0634 0-.1251.02143-.1963.072-.1646.11571-.0677.34886-.0677.34886l2.412 4.45714.4826.47829-.1509.15085-.0557.05572-.3857-.05315.0591.38229-.1114.11143-.0197-.01972c-.018-.018-.0429-.02742-.0669-.02742s-.048.00942-.0668.02742c-.0369.03686-.0369.09686 0 .13372l.0197.01971-.0532.054-.0137-.01457c-.0188-.018-.0428-.02743-.0668-.02743-.0249 0-.0489.00943-.0669.02743-.0368.03686-.0368.09686 0 .13372l.0146.01457-1.0149 1.02004-.0231-.0232c-.0189-.018-.0429-.0274-.0669-.0274s-.048.0094-.0668.0274c-.0369.0369-.0369.0969 0 .1337l.024.0232-.054.054-.018-.0172c-.018-.0188-.0429-.0283-.066-.0283-.0249 0-.0489.0095-.0677.0283-.036.0369-.036.096 0 .1329l.018.018-.132.1337-.018.1697.0694.0712-.0017.0008-.084.0857-5.47632 5.4755-.07114-.0592-.22714.0326-.12858.1303-.00857-.0086c-.01885-.0189-.04285-.0283-.06685-.0283s-.04886.0094-.06686.0283c-.03686.0369-.03686.096 0 .1329l.01028.0102-.05314.0549-.00514-.0051c-.018-.0189-.04286-.0283-.06686-.0283s-.048.0094-.06686.0283c-.036.0368-.036.096 0 .1328l.006.0069-1.002 1.0191-.02057-.0206c-.01885-.0188-.042-.0274-.06685-.0274-.024 0-.048.0086-.06686.0274-.03686.0369-.03686.0969 0 .1338l.02228.0214-.05314.054-.01628-.0163c-.01886-.018-.04286-.0274-.06772-.0274-.02314 0-.048.0094-.066.0274-.03686.0369-.03686.0969 0 .1337l.01714.018-.07457.0763-.38828-.0694.02914.4337-.12257.1251.10628.5846s.16286.5091.498.8469c.32486.3274.82029.4842.84172.5005l.55971.0977.138-.1354.38572.0626-.06343-.3814.11743-.1149.054.054c.018.018.042.0274.066.0274s.04885-.0094.06685-.0274c.03686-.0377.03686-.0969 0-.1337l-.05314-.0532.05486-.0531.04628.0463c.018.0188.04286.0283.06686.0283s.048-.0095.06686-.0283c.03686-.0369.03686-.096 0-.1329l-.04543-.0463 1.01743-1.0037.04457.0446c.018.0189.04286.0274.06686.0274s.048-.0085.06685-.0274c.036-.0369.036-.0969 0-.1337l-.04371-.0429.054-.054.03771.0377c.018.018.042.0275.066.0275.02486 0 .04886-.0095.06686-.0275.03686-.0368.03686-.0968 0-.1337l-.03686-.0368.114-.1115.04115-.2442-.06086-.0609.00086-.0009.11057-.1097 5.43946-5.4411-.0026-.0052.1063.1098.1706-.0189.1534-.1543.0248.0249c.0189.018.0429.0274.0669.0274s.0489-.0094.0669-.0274c.0368-.0369.0368-.0969 0-.1337l-.0249-.0249.054-.0531.0189.0188c.018.018.042.0274.0668.0274.024 0 .048-.0094.066-.0274.0369-.0368.0369-.0968 0-.1337l-.0188-.0197 1.0165-1.0183.0266.0266c.018.018.042.0274.066.0274.0249 0 .0489-.0094.0669-.0274.0368-.0369.0368-.0969 0-.1337l-.0266-.0266.054-.054.0206.0214c.0188.018.0428.0274.0668.0274s.048-.0094.0669-.0274c.0368-.0377.0368-.0968 0-.1337l-.0206-.0214.1131-.1132.378.0592z'/%3E%3Cpath d='m17.0057 16.7793-2.4111-1.8274-.4294-.4423-1.6637 1.6637.4183.3995 1.5711 2.3562 2.1188 2.3203 2.4421-2.2783z'/%3E%3C/g%3E%3C/svg%3E") !important;
    }

    [class*=permissionCheckmark-] {
      background-image: url("data:image/svg+xml,%3Csvg height='18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3Cpath d='m14.25 14.25h-10.5v-10.5h7.5v-1.5h-7.5c-.8325 0-1.5.6675-1.5 1.5v10.5c0 .8284271.67157288 1.5 1.5 1.5h10.5c.8284271 0 1.5-.6715729 1.5-1.5v-6h-1.5zm-7.5675-6.94-1.0575 1.065 3.375 3.375 7.5-7.5-1.0575-1.065-6.4425 6.4425z' fill='%23a6da95'/%3E%3C/g%3E%3C/svg%3E") !important;
    }

    [class*=removeKeybind-] {
      background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="18" height="18"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cpath d="M0 0h18v18H0"/%3E%3Cpath fill="%23181926" d="M14.25 4.8075L13.1925 3.75 9 7.9425 4.8075 3.75 3.75 4.8075 7.9425 9 3.75 13.1925 4.8075 14.25 9 10.0575l4.1925 4.1925 1.0575-1.0575L10.0575 9"/%3E%3C/g%3E%3C/svg%3E') !important;
    }

    [class*=removeGame-] {
      background-image: url("data:image/svg+xml,%3Csvg height='18' viewBox='0 0 18 18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m14.25 4.808-1.057-1.058-4.193 4.192-4.192-4.192-1.058 1.058 4.192 4.192-4.192 4.193 1.058 1.057 4.192-4.193 4.193 4.193 1.057-1.057-4.193-4.193z' fill-rule='nonzero' fill='%23ed8796'/%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3C/g%3E%3C/svg%3E") !important;
    }

    [class*=emojiRemove-] {
      background-image: url("data:image/svg+xml,%3Csvg height='18' viewBox='0 0 18 18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m14.25 4.808-1.057-1.058-4.193 4.192-4.192-4.192-1.058 1.058 4.192 4.192-4.192 4.193 1.058 1.057 4.192-4.193 4.193 4.193 1.057-1.057-4.193-4.193z' fill-rule='nonzero' fill='%23ed8796'/%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3C/g%3E%3C/svg%3E") !important;
    }

    [class*=lockIcon-] {
      content: url("data:image/svg+xml,%3Csvg height='14' viewBox='0 0 10 14' width='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='m553 515h-6v-1c0-1.654 1.346-3 3-3s3 1.346 3 3zm-4 6h2v-4h-2zm1-12c-2.762 0-5 2.238-5 5v1 4 2c0 1.104.896 2 2 2h6c1.104 0 2-.896 2-2v-2-4-1c0-2.762-2.238-5-5-5z' fill='%23a6da95' fill-rule='evenodd' transform='translate(-545 -509)'/%3E%3C/svg%3E") !important;
    }

    .theme-dark svg[class*=noItemsIcon-],
    .theme-light svg[class*=noItemsIcon-] {
      background-color: #494d64;
    }

    .theme-dark svg[class*=tier1ProfilePerk-],
    .theme-light svg[class*=tier1ProfilePerk-] {
      color: #8aadf4 !important;
    }

    .theme-dark svg[class*=tier1BoostPerk-],
    .theme-light svg[class*=tier1BoostPerk-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=tier1CustomEmojiPerk-],
    .theme-light svg[class*=tier1CustomEmojiPerk-] {
      color: #eed49f !important;
    }

    .theme-dark svg[class*=tier1UploadPerk-],
    .theme-light svg[class*=tier1UploadPerk-] {
      color: #b7bdf8 !important;
    }

    .theme-dark svg[class*=tier1StreamPerk-],
    .theme-light svg[class*=tier1StreamPerk-] {
      color: #a6da95 !important;
    }

    .theme-dark svg[class*=guildBoostingIcon-],
    .theme-light svg[class*=guildBoostingIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=guildSubscriptionSlotIcon-],
    .theme-light svg[class*=guildSubscriptionSlotIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=guildSubscriberCountIcon-],
    .theme-light svg[class*=guildSubscriberCountIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=gemWithLabel-],
    .theme-light svg[class*=gemWithLabel-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=gemWithoutLabel-],
    .theme-light svg[class*=gemWithoutLabel-] {
      color: #8087a2 !important;
    }

    .theme-dark svg[class*=memberBadgeIcon-],
    .theme-light svg[class*=memberBadgeIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=stickerIcon-],
    .theme-light svg[class*=stickerIcon-] {
      color: #c6a0f6 !important;
    }

    .theme-dark svg[class*=audioQualityIcon-],
    .theme-light svg[class*=audioQualityIcon-] {
      color: #7dc4e4 !important;
    }

    .theme-dark svg[class*=uploadSizeIcon-],
    .theme-light svg[class*=uploadSizeIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=threadIcon-],
    .theme-light svg[class*=threadIcon-] {
      color: #8bd5ca !important;
    }

    .theme-dark svg[class*=premiumIcon-],
    .theme-light svg[class*=premiumIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=gameIcon-],
    .theme-light svg[class*=gameIcon-] {
      color: #cad3f5 !important;
    }

    .theme-dark svg[class*=tierMarkerLabelPlusIcon-],
    .theme-light svg[class*=tierMarkerLabelPlusIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=currentTierIcon-],
    .theme-light svg[class*=currentTierIcon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=tier3Icon-],
    .theme-light svg[class*=tier3Icon-] {
      color: #f5bde6 !important;
    }

    .theme-dark svg[class*=searchIcon-],
    .theme-light svg[class*=searchIcon-] {
      color: #a5adcb !important;
    }

    .theme-dark svg[class*=upsellIcon-],
    .theme-light svg[class*=upsellIcon-] {
      color: #f5bde6 !important;
    }

    [class*=lookFilled-][class*=colorBrand-], [class*=lookFilled-][class*=colorBrandNew-], [class*=lookFilled-][class*=colorLink-], [class*=lookFilled-][class*=colorYellow-], [class*=lookFilled-][class*=colorRed-], [class*=lookFilled-][class*=colorGreen-] {
      color: #181926;
    }
    [class*=lookFilled-][class*=colorBrand-] svg[class^=premiumIcon], [class*=lookFilled-][class*=colorBrandNew-] svg[class^=premiumIcon], [class*=lookFilled-][class*=colorLink-] svg[class^=premiumIcon], [class*=lookFilled-][class*=colorYellow-] svg[class^=premiumIcon], [class*=lookFilled-][class*=colorRed-] svg[class^=premiumIcon], [class*=lookFilled-][class*=colorGreen-] svg[class^=premiumIcon] {
      color: #e864c4;
    }
    [class*=lookFilled-][class*=colorBrand-] [class*=spinnerItem-], [class*=lookFilled-][class*=colorBrandNew-] [class*=spinnerItem-], [class*=lookFilled-][class*=colorLink-] [class*=spinnerItem-], [class*=lookFilled-][class*=colorYellow-] [class*=spinnerItem-], [class*=lookFilled-][class*=colorRed-] [class*=spinnerItem-], [class*=lookFilled-][class*=colorGreen-] [class*=spinnerItem-] {
      background-color: #181926;
    }
    [class*=lookFilled-][class*=colorBrand-] [class*=defaultColor-], [class*=lookFilled-][class*=colorBrandNew-] [class*=defaultColor-], [class*=lookFilled-][class*=colorLink-] [class*=defaultColor-], [class*=lookFilled-][class*=colorYellow-] [class*=defaultColor-], [class*=lookFilled-][class*=colorRed-] [class*=defaultColor-], [class*=lookFilled-][class*=colorGreen-] [class*=defaultColor-] {
      color: #181926;
    }
    [class*=lookFilled-][class*=colorPrimary-] {
      color: #cad3f5;
    }

    div[class^=actionButtons-] [class^=button-][class*=buttonColor-],
    div[class^=actionButtons-] [class^=button-] [class*=buttonColor-] {
      background-color: #494d64;
    }
    div[class^=actionButtons-] [class^=button-][class*=buttonColor-][class*=buttonActive-],
    div[class^=actionButtons-] [class^=button-] [class*=buttonColor-][class*=buttonActive-] {
      background-color: #a6da95;
      color: #181926;
    }
    div[class^=actionButtons-] [class^=button-][class*=buttonColor-][class*=buttonActive-] [class*=buttonContents-],
    div[class^=actionButtons-] [class^=button-] [class*=buttonColor-][class*=buttonActive-] [class*=buttonContents-] {
      color: #181926;
    }
    div[class^=actionButtons-] [class^=button-][class*=buttonColor-][class*=buttonActive-] [class*=buttonContents-] svg,
    div[class^=actionButtons-] [class^=button-] [class*=buttonColor-][class*=buttonActive-] [class*=buttonContents-] svg {
      color: #181926;
    }

    [class*=lookInverted-][class*=colorBrand-] {
      color: var(--brand-experiment-600);
    }
    [class*=lookInverted-][class*=colorBrand-] svg[class^=premiumIcon] {
      color: #eb7bcd;
    }

    .theme-dark [class*=lookLink-][class*=colorPrimary-],
    .theme-light [class*=lookLink-][class*=colorPrimary-] {
      color: #cad3f5;
    }
    .theme-dark [class*=lookFilled-][class*=colorTransparent-],
    .theme-light [class*=lookFilled-][class*=colorTransparent-] {
      color: #cad3f5;
      background-color: #363a4f;
    }

    div[class*=button-][class*=dangerous-]:hover {
      color: #e65b6f;
    }

    div[role=radio][class*=selected] {
      color: #181926;
    }
    div[role=radio][class*=selected][class*=allow] {
      background-color: #a6da95;
    }

    [class*=container-][style*="background-color: var(--green-360)"] {
      --green-360: #a6da95;
      background-color: #a6da95 !important;
    }

    [class*=container-][style*="background-color: var(--primary-400)"], [class*=container-][style*="background-color: rgb(130, 133, 143)"] {
      background-color: #181926 !important;
    }

    .vc-spotify-button-row .vc-spotify-button.vc-spotify-shuffle-on, .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-context, .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-track {
      color: var(--interactive-normal);
    }
    .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-off, .vc-spotify-button-row .vc-spotify-button.vc-spotify-shuffle-off {
      color: var(--text-muted);
    }

    [class*=topGuildEmojiBadge-] {
      background: linear-gradient(268.26deg, #f5a97f, #ed8796 102.45%);
    }
    [class*=topGuildEmojiBadge-] * {
      color: #181926 !important;
    }

    [class*=newlyAddedBadge-] {
      background: linear-gradient(268.26deg, #8bd5ca, #a6da95 102.45%);
    }
    [class*=newlyAddedBadge-] * {
      color: #181926 !important;
    }

    [class*=lookFilled-] [class*=premiumSubscribeButton-] > [class*=premiumIcon-] {
      color: #181926 !important;
    }

    div[class^=sidebarRegion-] div[class^=serverBoostTabItem-] svg[class^=icon-] {
      fill: #f5bde6 !important;
    }
    div[class^=sidebarRegion-] div[class^=serverBoostTabItem-][class*=selected-] {
      background-color: #8aadf4 !important;
      color: #181926 !important;
    }
    div[class^=sidebarRegion-] div[class^=serverBoostTabItem-][class*=selected-] svg[class^=icon-] {
      fill: #181926 !important;
    }
    div[class^=sidebarRegion-] div[class^=premiumTab-] > div > svg > path {
      fill: #f5bde6;
    }
    div[class^=sidebarRegion-] div[class^=premiumTab-] > div[class*=selected] {
      color: #181926;
    }
    div[class^=sidebarRegion-] div[class^=premiumTab-] > div[class*=selected] svg > path {
      fill: #181926;
    }
    div[class^=sidebarRegion-] div[class*=tabBarItemContainer-] [class*=textBadge-] {
      color: #181926;
    }
    div[class^=sidebarRegion-] div[class*=tabBarItemContainer-] [class*=textBadge-][style*="background-color: var(--brand-500);"] {
      background-color: #8aadf4 !important;
    }

    div[class^=contentRegion-] div[class*=noticeRegion-] div[style="background-color: rgb(24, 25, 28);"] {
      background-color: #181926 !important;
    }
    div[class^=contentRegion-] [class^=bar-],
    div[class^=contentRegion-] [class^=markDash-] {
      background: #494d64;
    }
    div[class^=contentRegion-] [id="privacy-&-safety-tab"] div[class^=radioBar-][style*="hsl(139,"] {
      border-color: #a6da95;
    }
    div[class^=contentRegion-] [id="privacy-&-safety-tab"] div[class^=radioBar-][style*="hsl(37,"] {
      border-color: #eed49f;
    }
    div[class^=contentRegion-] [id="privacy-&-safety-tab"] div[class^=radioBar-][style*="hsl(359,"] {
      border-color: #ed8796;
    }
    div[class^=contentRegion-] [id="privacy-&-safety-tab"] div[class*=betaTagIcon] {
      background-color: #8aadf4 !important;
      color: #181926;
    }
    div[class^=contentRegion-] #accessibility-tab button[class*=colorBrandNew] {
      background-color: #8aadf4;
    }
    div[class^=contentRegion-] #keybinds-tab span[class*=key] {
      color: #181926;
    }
    div[class^=contentRegion-] #keybinds-tab span[class*=key] g {
      fill: #181926;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab circle[class^=circleProgress-] {
      color: #f5bde6;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab div[class*=gemIndicatorContainer-] {
      background-color: #24273a;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab div[class*=gemIndicatorContainer-] div[class^=tierLabel-] {
      color: #b8c0e0;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab button[class*=lookInverted-] {
      color: #181926;
      background-color: #cad3f5;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab button[class*=lookInverted-]:hover {
      background-color: #ccd5f5;
    }
    div[class^=contentRegion-] #nitro-server-boost-tab div[class*=card-],
    div[class^=contentRegion-] #nitro-server-boost-tab h3[class*=price-] {
      color: #cad3f5 !important;
    }
    div[class^=contentRegion-] #subscriptions-tab [class^=sectionAccountCredit-],
    div[class^=contentRegion-] #subscriptions-tab [class^=subscriptionDetails-] {
      border-color: var(--background-modifier-accent);
    }
    div[class^=contentRegion-] #library-inventory-tab div[class^=promotionIcon-] {
      background-color: #24273a;
    }
    div[class^=contentRegion-] #discord-nitro-tab button[class*=buttonWhite] {
      color: #cad3f5 !important;
      border-color: #cad3f5 !important;
    }
    div[class^=contentRegion-] #discord-nitro-tab h2 {
      color: #cad3f5 !important;
    }
    div[class^=contentRegion-] #discord-nitro-tab svg[class*=sparkleStar-] {
      color: #cad3f5;
    }
    div[class^=contentRegion-] #discord-nitro-tab div[class*=description-] {
      color: #b8c0e0 !important;
    }
    div[class^=contentRegion-] #discord-nitro-tab div[class*=card-] {
      color: #cad3f5;
    }
    div[class^=contentRegion-] #discord-nitro-tab button[class*=lookInverted-] {
      color: #181926;
      background-color: #cad3f5;
    }
    div[class^=contentRegion-] #discord-nitro-tab button[class*=lookInverted-]:hover {
      background-color: #ccd5f5;
    }
    div[class^=contentRegion-] #billing-tab div[class*=subtext] {
      color: #b8c0e0;
    }
    div[class^=contentRegion-] #billing-tab [class*=Divider] {
      border-color: var(--background-modifier-accent);
    }
    div[class^=contentRegion-] #billing-tab div[class^=defaultIndicator-] {
      color: #cad3f5;
      background-color: #494d64;
    }
    div[class^=contentRegion-] #billing-tab div[class*=summaryInfo],
    div[class^=contentRegion-] #billing-tab [class^=paymentHeader-] {
      color: #cad3f5;
      border-color: var(--background-modifier-accent);
    }
    div[class^=contentRegion-] #billing-tab div[class^=premiumIndicator-] {
      color: #181926;
    }
    div[class^=contentRegion-] #billing-tab div[class^=paymentPane-],
    div[class^=contentRegion-] #billing-tab div[class*=paginator-],
    div[class^=contentRegion-] #billing-tab div[class*=payment-] {
      background-color: #363a4f;
      color: #cad3f5;
    }
    div[class^=contentRegion-] #billing-tab div[class^=expandedInfo-] {
      background-color: #494d64;
    }
    div[class^=contentRegion-] #billing-tab [class*=paymentText-] {
      color: #b8c0e0;
    }
    div[class^=contentRegion-] #billing-tab div[class^=codeRedemptionRedirect-] {
      background-color: #1e2030;
      color: #cad3f5;
      border-color: #363a4f;
    }
    div[class^=contentRegion-] [id="voice-&-video-tab"] div[class^=backgroundOptionRing-] {
      border-color: #8aadf4;
    }
    div[class^=contentRegion-] #notifications-tab button[class*=marketingUnsubscribeButton-] {
      color: #cad3f5;
    }
    div[class^=contentRegion-] #game-activity-tab div[class*=nowPlayingAdd-],
    div[class^=contentRegion-] #game-activity-tab div[class*=lastPlayed-],
    div[class^=contentRegion-] #game-activity-tab div[class*=overlayStatusText-] {
      color: var(--text-muted);
    }
    div[class^=contentRegion-] #game-activity-tab div[class*=activeGame-][class*=nowPlaying] * {
      color: #181926;
    }
    div[class^=contentRegion-] #game-activity-tab div[class*=activeGame-][class*=nowPlaying] * svg > g > path {
      fill: #181926;
    }
    div[class^=contentRegion-] #game-activity-tab input[class^=gameName-] {
      color: #cad3f5;
    }
    div[class^=contentRegion-] #game-activity-tab input[class*=gameNameInput-]:hover, div[class^=contentRegion-] #game-activity-tab input[class*=gameNameInput-]:focus {
      background-color: #1e2030;
      border-color: rgba(30, 32, 48, 0.3);
      color: #cad3f5;
    }
    div[class^=contentRegion-] #game-activity-tab div[class*=game-] {
      -webkit-box-shadow: 0 1px 0 0 var(--background-modifier-accent);
      box-shadow: 0 1px 0 0 var(--background-modifier-accent);
    }
    div[class^=contentRegion-] #game-activity-tab div[class*=removeGame-] {
      background-color: #363a4f;
    }
    div[class^=contentRegion-] #emoji-tab div[class*=emojiRemove-] {
      background-color: #363a4f;
    }
    div[class^=contentRegion-] section[class^=inputSensitivityToggle-] div[class*=speaking-] {
      background: #a6da95 !important;
    }
    div[class^=contentRegion-] div[class*=reactionMe-] {
      background-color: #363a4f !important;
    }
    div[class^=contentRegion-] div[class^=control-] > div[class*=checked-],
    div[class^=contentRegion-] div[class^=sensitivity-] div[class*=checked-],
    div[class^=contentRegion-] div[style*="background-color: hsl(139, calc(var(--saturation-factor, 1) * 47.3%), 43.9%)"] {
      background-color: #a6da95 !important;
    }
    div[class^=contentRegion-] div[class^=control] > div[style*="background-color: hsl(218, calc(var(--saturation-factor, 1) * 4.6%), 46.9%)"] {
      background-color: #5b6078 !important;
    }
    div[class^=contentRegion-] div[class^=control] svg[class^=slider-] > svg > path {
      fill: #3e792a !important;
    }
    div[class^=contentRegion-] #guild_premium-tab [class*=tierAccomplished-],
    div[class^=contentRegion-] #guild_premium-tab [class*=tierCurrent-],
    div[class^=contentRegion-] #guild_premium-tab [class*=tierFirst-] {
      background: #f5bde6;
    }
    div[class^=contentRegion-] #guild_premium-tab [class*=tierInProgress-] {
      background-color: #181926;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=progressWithSubscriptions-] > svg > g > rect:first-child {
      color: #181926;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=progressWithSubscriptions-] > svg > g > rect:nth-child(2) {
      color: #f5bde6;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderUnlocked-],
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderLocked-] {
      background-color: #181926;
      color: #a5adcb;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderUnlocked-] div[class^=tierUnlocked-],
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderLocked-] div[class^=tierUnlocked-] {
      background-image: linear-gradient(90deg, #8aadf4, #c6a0f6);
      color: #181926;
      font-weight: 600;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderUnlocked-] svg[class^=tierIcon-],
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderLocked-] svg[class^=tierIcon-] {
      color: #f5bde6;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderUnlocked-] svg[class*=tierIconLocked-],
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderLocked-] svg[class*=tierIconLocked-] {
      color: #8087a2;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderUnlocked-] svg[class^=tierLock-],
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierHeaderLocked-] svg[class^=tierLock-] {
      color: #5b6078;
    }
    div[class^=contentRegion-] #guild_premium-tab div[class^=tierBody-] {
      color: #b8c0e0;
      background-color: #1e2030;
    }
    div[class^=contentRegion-] svg[class^=activeCircle-] {
      color: #181926;
      background-color: #a6da95;
    }
    div[class^=contentRegion-] #discovery-tab div[class*=checklistIcon] svg[viewBox="0 0 14 14"] path {
      fill: #ed8796;
    }
    div[class^=contentRegion-] #discovery-tab div[class*=checklistIcon] svg[viewBox="0 0 20 20"] path {
      fill: #eed49f;
    }
    div[class^=contentRegion-] #guild_templates-tab svg[class*=descriptionIcon][viewBox="0 0 24 24"] path {
      fill: #a6da95;
    }
    div[class^=contentRegion-] #guild_templates-tab svg[class*=descriptionIcon][viewBox="0 0 14 14"] path {
      fill: #ed8796;
    }
    div[class^=contentRegion-] #guild_templates-tab svg[class*=descriptionIcon] circle {
      fill: #181926;
    }
    div[class^=contentRegion-] #stickers-tab div[class*=tierHeaderContent] {
      background-color: #181926;
    }
    div[class^=contentRegion-] #stickers-tab div[class*=tierBody] {
      background-color: #1e2030;
    }
    div[class^=contentRegion-] #roles-tab div[class*=previewContainer-] .theme-light img[class*=roleIcon-] {
      content: "data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M11.0749 1.66667H4.99996C3.15901 1.66667 1.66663 3.15906 1.66663 5.00001V15C1.66663 16.841 3.15901 18.3333 4.99996 18.3333H15C16.8409 18.3333 18.3333 16.841 18.3333 15V8.92511C17.8052 9.08227 17.2458 9.16667 16.6666 9.16667C13.445 9.16667 10.8333 6.555 10.8333 3.33334C10.8333 2.75419 10.9177 2.19476 11.0749 1.66667ZM6.66663 5.00001C7.58596 5.00001 8.33329 5.74601 8.33329 6.66667C8.33329 7.58801 7.58596 8.33334 6.66663 8.33334C5.74529 8.33334 4.99996 7.58801 4.99996 6.66667C4.99996 5.74601 5.74529 5.00001 6.66663 5.00001ZM4.99996 15L7.49996 11.6667L9.16663 13.3333L12.5 9.16667L15 15H4.99996Z' fill='%23494d64'/%3E%3Cpath d='M17.5 0V2.5H20V4.16667H17.5V6.66667H15.8334V4.16667H13.3334V2.5H15.8334V0H17.5Z' fill='%23494d64'/%3E%3C/svg%3E";
    }
    div[class^=contentRegion-] #roles-tab div[class*=previewContainer-] .theme-dark img[class*=roleIcon-] {
      content: "data:image/svg+xml,%3Csvg fill='none' height='20' viewBox='0 0 20 20' width='20' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23cad3f5'%3E%3Cpath clip-rule='evenodd' d='m11.0749 1.66667h-6.07488c-1.84095 0-3.33333 1.49239-3.33333 3.33334v9.99999c0 1.841 1.49238 3.3333 3.33333 3.3333h9.99998c1.841 0 3.3334-1.4923 3.3334-3.3333v-6.07489c-.5281.15716-1.0876.24156-1.6667.24156-3.2217 0-5.8333-2.61167-5.8333-5.83333 0-.57915.0844-1.13858.2415-1.66667zm-4.40821 3.33334c.91933 0 1.66666.746 1.66666 1.66666 0 .92134-.74733 1.66667-1.66666 1.66667-.92134 0-1.66667-.74533-1.66667-1.66667 0-.92066.74533-1.66666 1.66667-1.66666zm-1.66667 9.99999 2.5-3.3333 1.66667 1.6666 3.33331-4.16663 2.5 5.83333z' fill-rule='evenodd'/%3E%3Cpath d='m17.5 0v2.5h2.5v1.66667h-2.5v2.5h-1.6667v-2.5h-2.5v-1.66667h2.5v-2.5z'/%3E%3C/g%3E%3C/svg%3E";
    }

    .bd-settings-title {
      color: #cad3f5;
    }

    .bd-switch-body {
      --switch-color: #5b6078;
    }
    .bd-switch input:checked + .bd-switch-body {
      --switch-color: #a6da95;
    }
    .bd-switch input:checked + .bd-switch-body svg.bd-switch-symbol path {
      fill: #3e792a;
    }

    .bd-button {
      background-color: #8aadf4;
      color: #181926;
    }
    .bd-button.bd-button-danger {
      background-color: #ed8796;
    }

    .bd-controls > .bd-addon-button svg {
      fill: #181926;
    }

    .bd-addon-views .bd-view-button.selected {
      background-color: #8aadf4;
    }
    .bd-addon-views .bd-view-button.selected svg {
      fill: #181926;
    }

    div[class^=perksModal] {
      background-color: #24273a;
    }
    div[class^=perksModal] li[class^=perk] {
      background-color: #1e2030;
    }
    div[class^=perksModal] li[class^=perk] svg {
      color: #f5bde6;
    }
    div[class^=perksModal] svg[class^=giftIcon] {
      color: #181926;
    }
    div[class^=perksModal] div[class^=tierHeaderUnlocked] {
      background-image: linear-gradient(90deg, #8aadf4, #c6a0f6);
      color: #24273a;
    }
    div[class^=perksModal] div[class^=tierUnlocked-],
    div[class^=perksModal] div[class^=tierMarkerBackground-] {
      background-color: #24273a;
    }
    div[class^=perksModal] div[class^=barBackground],
    div[class^=perksModal] div[class^=tierMarkerInProgress],
    div[class^=perksModal] div[class^=tierBody] {
      background-color: #181926 !important;
    }
    div[class^=perksModal] div[class^=tierMarkerAccomplished] {
      background: #f5bde6 !important;
    }
    div[class^=perksModal] div[class^=tierMarkerInProgress] [class^=currentTierIcon] {
      color: #f5bde6;
    }
    div[class^=perksModal] div[class^=barForeground],
    div[class^=perksModal] div[class^=tierMarkerAccomplished] {
      background-color: #f5bde6;
    }
    div[class^=perksModal] svg[class^=currentTierIcon] {
      color: #24273a;
    }
    div[class^=perksModal] div[class*=tierMarkerLabelText],
    div[class^=perksModal] svg[class^=tierLock] {
      color: var(--text-muted);
    }
    div[class^=perksModal] div[class*=selectedTier] div[class*=tierMarkerLabelText] {
      color: var(--text-normal);
    }
    div[class^=perksModal] div[class^=tierHeaderLocked] {
      background-color: #0e0f16;
      color: var(--text-muted);
    }
    div[class^=perksModal] svg[class*=unlocked] {
      color: #a6da95;
    }

    div[class^=sidebar-] div[class^=container] div[class^=progressBar-] {
      background: linear-gradient(90deg, #8aadf4, #c6a0f6);
    }
    div[class^=sidebar-] div[class^=container]:hover div[class^=progressBar-] {
      background: linear-gradient(90deg, hsl(221deg, 70%, 55.5%), #c6a0f6 34%, #8aadf4 67%, #c6a0f6);
    }
    div[class^=sidebar-] div[class^=container] div[class^=divider-] {
      border-color: var(--background-modifier-accent);
    }

    div[class^=pageWrapper-] {
      background: #24273a !important;
    }
    div[class^=pageWrapper-] div[class*=searchBox-] {
      background-color: #1e2030;
    }
    div[class^=pageWrapper-] div[class*=searchBox-] svg[class*=clearIcon] path {
      fill: #6e738d;
    }
    div[class^=pageWrapper-] div[class*=categoryPill-][class*=selected-] div {
      color: #181926 !important;
    }

    div[class^=homeContainer-] {
      background: #24273a !important;
    }
    div[class^=homeContainer-] > div[class^=homeContent-] div[class*=card-] {
      background: #363a4f !important;
    }

    section[class^=title-] {
      background: var(--background-primary) !important;
    }

    div[class^=categoryItem-][class*=selectedCategoryItem],
    button[class*=lookFilled] div[class*=addButton] {
      color: #181926 !important;
    }

    div[class^=itemInner-] div[class^=new-] > div[class*=newText-] {
      color: #181926 !important;
    }

    div[class*=directoryModal-] {
      background-color: #24273a !important;
    }
    div[class*=directoryModal-] [class*=searchBox] {
      background-color: #1e2030 !important;
    }
    div[class*=directoryModal-] [class*=searchBox] [name=search]::placeholder {
      color: #a5adcb;
    }
    div[class*=directoryModal-] [role=button][class*=activeButton] {
      color: #181926;
    }

    section[class^=guildListSection-] div[class^=guildList]:first-child div[class^=iconContainer-] {
      background-color: #a6da95;
    }
    section[class^=guildListSection-] div[class^=guildList]:first-child div[class^=iconContainer-] > div[class^=icon-] {
      background-image: url("data:image/svg+xml,%3Csvg fill='none' height='24' viewBox='0 0 25 24' width='25' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23181926'%3E%3Cpath clip-rule='evenodd' d='m13.25 18v-12h-1.5v12z' fill-rule='evenodd'/%3E%3Cpath clip-rule='evenodd' d='m7 12.75c-.69036 0-1.25.5596-1.25 1.25v4h-1.5v-4c0-1.5188 1.23122-2.75 2.75-2.75h11c1.5188 0 2.75 1.2312 2.75 2.75v4h-1.5v-4c0-.6904-.5596-1.25-1.25-1.25z' fill-rule='evenodd'/%3E%3Cpath d='m12.5 7c-1.3807 0-2.5-1.11929-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.11929 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m20 22c-1.3807 0-2.5-1.1193-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m12.5 22c-1.3807 0-2.5-1.1193-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m5 22c-1.38071 0-2.5-1.1193-2.5-2.5s1.11929-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.11929 2.5-2.5 2.5z'/%3E%3C/g%3E%3C/svg%3E");
    }

    path[d="M22 12.4065C21.8956 14.9141 20.8533 17.2908 19.0798 19.0654C17.3062 20.8401 14.931 21.883 12.425 21.9875L13.7625 15.646L17.2375 17.9224C17.3214 17.9702 17.416 17.996 17.5125 17.9975C17.6481 17.9962 17.7781 17.9424 17.875 17.8474C17.9439 17.7577 17.9813 17.6478 17.9813 17.5347C17.9813 17.4216 17.9439 17.3117 17.875 17.222L15.6 13.7323L22 12.4065ZM13.7625 8.34148L17.2375 6.06504C17.3352 6.00866 17.4487 5.98608 17.5605 6.00084C17.6723 6.0156 17.7762 6.06686 17.8559 6.14665C17.9357 6.22645 17.9869 6.33037 18.0017 6.44225C18.0164 6.55413 17.9938 6.66772 17.9375 6.76548L15.6625 10.2551L22 11.581C21.8956 9.07342 20.8533 6.69669 19.0798 4.92206C17.3062 3.14742 14.931 2.10449 12.425 2L13.7625 8.34148ZM10.275 8.34148L11.6 2C9.09402 2.10449 6.71878 3.14742 4.94525 4.92206C3.17172 6.69669 2.12945 9.07342 2.02502 11.581L8.37497 10.2551L6.08752 6.76548C6.02873 6.66774 6.00413 6.55315 6.01772 6.43988C6.0313 6.32661 6.08228 6.22113 6.16252 6.14009C6.24233 6.05781 6.34797 6.00542 6.46175 5.99176C6.57552 5.97809 6.69052 6.00399 6.78752 6.06504L10.275 8.34148ZM6.16252 17.8474C6.08228 17.7663 6.0313 17.6609 6.01772 17.5476C6.00413 17.4343 6.02873 17.3197 6.08752 17.222L8.37497 13.7323L2 12.4065C2.10442 14.9141 3.1467 17.2908 4.92023 19.0654C6.69376 20.8401 9.06899 21.883 11.575 21.9875L10.25 15.646L6.7625 17.9224C6.67925 17.9718 6.58428 17.9977 6.48753 17.9975C6.35971 17.9937 6.23848 17.9398 6.15001 17.8474H6.16252Z"] {
      fill: #8bd5ca;
    }

    path[d="M17.225 6.06504C17.3227 6.00866 17.4362 5.98608 17.548 6.00084C17.6598 6.0156 17.7637 6.06686 17.8434 6.14665C17.9232 6.22645 17.9744 6.33037 17.9892 6.44225C18.0039 6.55413 17.9813 6.66772 17.925 6.76548L15.65 10.2551L21.9875 11.581C21.9875 11.7185 21.9875 11.8562 21.9875 11.9937C21.9875 12.1313 21.9875 12.2689 21.9875 12.4065L15.65 13.7323L17.925 17.222C17.9939 17.3117 18.0313 17.4216 18.0313 17.5347C18.0313 17.6478 17.9939 17.7577 17.925 17.8474C17.8281 17.9424 17.6982 17.9962 17.5625 17.9975C17.466 17.996 17.3714 17.9702 17.2875 17.9224L13.8125 15.646L12.4125 22H11.5875L10.2625 15.6585L6.77501 17.935C6.69176 17.9843 6.59672 18.0102 6.49997 18.01C6.43455 18.0098 6.3699 17.9963 6.30977 17.9705C6.24964 17.9447 6.1953 17.9072 6.15001 17.8599C6.06977 17.7789 6.01879 17.6734 6.0052 17.5601C5.99162 17.4468 6.01621 17.3323 6.07501 17.2345L8.36253 13.7449L2 12.4065C2 12.2689 2 12.1313 2 11.9937C2 11.8562 2 11.7185 2 11.581L8.35002 10.2551L6.0625 6.76548C6.0037 6.66774 5.97918 6.55315 5.99277 6.43988C6.00635 6.32661 6.05726 6.22113 6.1375 6.14009C6.21731 6.05781 6.32295 6.00542 6.43672 5.99176C6.5505 5.97809 6.6655 6.00399 6.7625 6.06504L10.25 8.34148L11.575 2H12.4L13.7375 8.34148L17.225 6.06504Z"] {
      fill: #181926;
    }

    div[class^=tierPreviews-] button[class^=button-] {
      background: linear-gradient(90deg, #8bd5ca, #8aadf4);
    }

    div[class^=notice-] div[class*=noticeText-] {
      color: #181926;
    }
    div[class^=notice-] div[class*=header-] {
      color: #181926;
    }
    div[class^=notice-] div[class^=closeButton-] > svg > path {
      fill: #181926;
    }
    div[class^=notice-] button[class^=button-] {
      border-color: #181926;
      color: #181926;
    }
    div[class^=notice-] button[class^=button-]:hover {
      background: #5b8cf0;
    }

    nav[class*=guilds-] foreignObject > div[data-list-item-id^=guildsnav_] {
      background-color: #282b40;
    }
    nav[class*=guilds-] foreignObject > div[data-list-item-id^=guildsnav_]:hover > div[class^=childWrapper-], nav[class*=guilds-] foreignObject > div[data-list-item-id^=guildsnav_][class*=selected] > div[class^=childWrapper-] {
      color: #181926;
      font-weight: 600;
    }
    nav[class*=guilds-] div[data-list-item-id=guildsnav___home] {
      --background-primary: #2a2d43;
    }
    nav[class*=guilds-] span[class^=expandedFolderBackground-] {
      background-color: #2a2d43;
    }
    nav[class*=guilds-] div[class^=folder-][class*=hover-] {
      background-color: #343853;
    }
    nav[class*=guilds-] div[data-list-item-id=guildsnav___create-join-button] svg > path,
    nav[class*=guilds-] div[data-list-item-id=guildsnav___guild-discover-button] svg > path,
    nav[class*=guilds-] div[data-list-item-id=guildsnav___app-download-button] svg > path {
      fill: #a6da95;
    }

    div[class^=upperBadge] > div[class^=iconBadge] path {
      color: #181926;
    }
    div[class^=upperBadge] div[class*=participating-] {
      background: #a6da95;
    }

    div[class^=lowerBadge] div[class^=iconBadge] path {
      color: #181926;
    }

    svg[class^=spine-] {
      color: #5b6078;
    }

    div[class^=spineBorder-] {
      background: #5b6078;
    }

    ul[aria-label$=" threads"] > li:nth-child(1n) {
      --channels-default: #d5bcd9;
      --interactive-hover: #ed8796;
      --interactive-active: #ed8796;
    }

    ul[aria-label$=" threads"] > li:nth-child(2n) {
      --channels-default: #d7c6d2;
      --interactive-hover: #f5a97f;
      --interactive-active: #f5a97f;
    }

    ul[aria-label$=" threads"] > li:nth-child(3n) {
      --channels-default: #d5d3db;
      --interactive-hover: #eed49f;
      --interactive-active: #eed49f;
    }

    ul[aria-label$=" threads"] > li:nth-child(4n) {
      --channels-default: #bfd5d8;
      --interactive-hover: #a6da95;
      --interactive-active: #a6da95;
    }

    ul[aria-label$=" threads"] > li:nth-child(5n) {
      --channels-default: #b7c8f5;
      --interactive-hover: #7dc4e4;
      --interactive-active: #7dc4e4;
    }

    ul[aria-label$=" threads"] > li:nth-child(6n) {
      --channels-default: #c9c4f5;
      --interactive-hover: #c6a0f6;
      --interactive-active: #c6a0f6;
    }

    [class^=botText] {
      color: #181926;
      font-weight: 600;
    }

    svg[class^=botTagVerified] {
      color: #181926;
    }

    div[class*=activePostCount-] {
      background-color: #363a4f;
      color: #cad3f5 !important;
    }

    div[class*=newPostCount-] {
      background-color: #cad3f5;
      color: #181926;
    }

    div[class*=liveSmall-] {
      background-color: #ed8796 !important;
      color: #181926;
    }

    [class^=chatContent] div[class*=wrapperAudio-] div[class*=audioControls],
    [class^=chatContent] div[class*=wrapperAudio-] div[class*=videoControls-],
    [class^=chatContent] div[class*=imageWrapper-] div[class*=audioControls],
    [class^=chatContent] div[class*=imageWrapper-] div[class*=videoControls-] {
      background-color: rgba(30, 32, 48, 0.8);
    }
    [class^=chatContent] div[class*=wrapperAudio-] div[class*=audioControls] svg[class*=controlIcon-],
    [class^=chatContent] div[class*=wrapperAudio-] div[class*=videoControls-] svg[class*=controlIcon-],
    [class^=chatContent] div[class*=imageWrapper-] div[class*=audioControls] svg[class*=controlIcon-],
    [class^=chatContent] div[class*=imageWrapper-] div[class*=videoControls-] svg[class*=controlIcon-] {
      opacity: 1;
      color: #b8c0e0;
    }
    [class^=chatContent] #---new-messages-bar span[class^=unreadPill-] {
      color: #181926;
    }
    [class^=chatContent] div[class^=newMessagesBar-] button {
      color: #181926;
    }
    [class^=chatContent] div[class^=channelTextArea-] div[class^=buttons-] * {
      color: var(--interactive-normal) !important;
    }
    [class^=chatContent] [id^=message-reactions-] div[class^=reaction-] {
      background-color: #363a4f;
    }
    [class^=chatContent] [id^=message-reactions-] div[class^=reaction-]:hover {
      background-color: var(--brand-experiment-20a);
      border-color: var(--brand-experiment-30a);
    }
    [class^=chatContent] div[class*=isBurstReactionPicker-] {
      box-shadow: 0 0 0 2px #c6a0f6, 0 0 16px #b7bdf8;
    }
    [class^=chatContent] div[class^=navButtonSuperReactActive-], [class^=chatContent] div[class^=navButtonSuperReactActive-]:hover {
      background: linear-gradient(270deg, #f5bde6, #b7bdf8 33.63%, #c6a0f6);
      color: #181926;
    }
    [class^=chatContent] div[class*=betaTag-] {
      background: var(--brand-experiment) !important;
      color: #181926;
    }
    [class^=chatContent] button[class*=navButtonActive-], [class^=chatContent] button[class*=navButtonActive-]:hover {
      color: #181926;
    }
    [class^=chatContent] div[class*=colorPremiumGradient-][class*=focused-] {
      background: linear-gradient(270deg, #f5bde6, #b7bdf8 33.63%, #c6a0f6);
      color: #181926 !important;
    }
    [class^=chatContent] div[class*=isBurstReactionPicker] {
      border: none;
      box-shadow: 0 0 0 2px #c6a0f6, 0 0 16px #b7bdf8;
    }
    [class^=chatContent] div[class*=playButtonContainer-] {
      background: var(--brand-experiment) !important;
    }
    [class^=chatContent] svg[class*=playIcon-] path {
      fill: #181926;
    }
    [class^=chatContent] div[class^=container-][class*=header-] div[class*=addReactButton-],
    [class^=chatContent] div[class^=container-][class*=header-] div[class^=buttons-]:not([class*=lookBlank-]) div[class^=contents] {
      background: #363a4f;
    }
    [class^=chatContent] div[class^=container-][class*=header-] div[class*=addReactButton-]:hover,
    [class^=chatContent] div[class^=container-][class*=header-] div[class^=buttons-]:not([class*=lookBlank-]) div[class^=contents]:hover {
      background-color: var(--brand-experiment-20a);
      border-color: var(--brand-experiment-30a);
    }
    [class^=chatContent] div[class^=messagesErrorBar-] div[class*=barButtonBase-] {
      color: #181926;
    }
    [class^=chatContent] [class*=inlineCode-] {
      background: #363a4f;
    }
    [class^=chatContent] code.inline {
      background: #363a4f;
    }
    [class^=chatContent] div[class^=container-] div[class^=cardWrapper-] div[class*=completed-] svg[class^=checkmark-] {
      background-color: #a6da95;
      color: #181926;
    }

    div[style*="d1382af8d9e755bc44811b1fd92990a8.svg"] {
      background-image: url("data:image/svg+xml,%3Csvg height='18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m18 0h-18v18h18z'/%3E%3Cpath d='m0 8h14.2l-3.6-3.6 1.4-1.4 6 6-6 6-1.4-1.4 3.6-3.6h-14.2' fill='%23a6da95'/%3E%3C/g%3E%3C/svg%3E") !important;
      filter: none !important;
    }

    main[class^=chatContent] div[id^=message-content-] svg[class^=icon-] > path[d="M4 0L0 4V8L4 12L8 8V4L4 0ZM7 7.59L4 10.59L1 7.59V4.41L4 1.41L7 4.41V7.59Z"],
    main[class^=chatContent] div[id^=message-content-] svg[class^=icon-] > path[d="M2 4.83V7.17L4 9.17L6 7.17V4.83L4 2.83L2 4.83Z"] {
      color: #f5bde6;
    }

    .theme-dark span[class^=spoilerText],
    .theme-dark div[class^=spoilerText],
    .theme-light span[class^=spoilerText],
    .theme-light div[class^=spoilerText] {
      background-color: #363a4f;
    }
    .theme-dark span[class^=spoilerText][class*=hidden],
    .theme-dark div[class^=spoilerText][class*=hidden],
    .theme-light span[class^=spoilerText][class*=hidden],
    .theme-light div[class^=spoilerText][class*=hidden] {
      background-color: #5b6078;
    }
    .theme-dark span[class^=spoilerText][class*=hidden]:hover,
    .theme-dark div[class^=spoilerText][class*=hidden]:hover,
    .theme-light span[class^=spoilerText][class*=hidden]:hover,
    .theme-light div[class^=spoilerText][class*=hidden]:hover {
      background-color: #666c87;
    }
    .theme-dark div[class^=spoilerContainer-] div[class^=spoilerWarning-],
    .theme-light div[class^=spoilerContainer-] div[class^=spoilerWarning-] {
      color: #cad3f5;
      background-color: rgba(24, 25, 38, 0.7);
    }
    .theme-dark div[class^=spoilerContainer-]:hover div[class^=spoilerWarning-],
    .theme-light div[class^=spoilerContainer-]:hover div[class^=spoilerWarning-] {
      color: #cad3f5;
      background-color: #181926;
    }
    .theme-dark div[class^=spoilerContainer-] article[class*=embedFull-],
    .theme-light div[class^=spoilerContainer-] article[class*=embedFull-] {
      border-color: #5b6078;
    }

    div[class^=cooldownWrapper-] {
      color: var(--text-muted) !important;
    }

    div[class*=autocomplete-] {
      background-color: #1e2030 !important;
    }
    div[class*=autocomplete-] div[class*=categoryHeader] {
      background-color: #1e2030 !important;
    }
    div[class*=autocomplete-] div[class*=autocompleteRowSubheading] {
      background-color: transparent;
    }
    div[class*=autocomplete-] div[class*=autocompleteRowContentSecondary] {
      background-color: transparent;
    }
    div[class*=autocomplete-] div[class^=usageWrapper-] > div[class*=title-] {
      color: #8aadf4 !important;
    }
    div[class*=autocomplete-] strong {
      color: #8aadf4 !important;
    }

    div[class^=channelTextArea-] button[class*=emojiButton-] {
      background: transparent !important;
    }

    [class*=uploadDropModal-] div[class^=inner] {
      border-color: #181926;
    }
    [class*=uploadDropModal-] div[class^=inner] * {
      color: #181926 !important;
    }

    div[class^=chat] > div[class^=content-] > div[class^=container-] {
      background-color: #24273a;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class^=pinIcon-] > svg > path,
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class^=stepStatus-] > svg > path {
      fill: #a5adcb;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class^=pinIcon-][style*="background-color: var(--status-positive-background);"] > svg > path,
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class^=stepStatus-][style*="background-color: var(--status-positive-background);"] > svg > path {
      fill: #181926;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class*=countText] {
      color: #181926;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] svg[class^=discordIcon-] {
      background-color: #8aadf4;
      color: #181926;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class^=newBadge-] {
      background-color: #b7bdf8 !important;
      color: #181926;
    }
    div[class^=chat] > div[class^=content-] > div[class^=container-] div[class*=mainCard-] {
      background-color: #363a4f;
    }

    div[class^=sidebar-] > section[class^=panels-] svg[class*=buttonIcon-],
    div[class^=sidebar-] > section[class^=panels-] div[class*=buttonContents] {
      fill: #cad3f5;
      color: #cad3f5;
    }

    [data-list-id^=forum-channel-list-] div[class^=body-] > div[class^=tags] div[class*=pill] {
      background-color: #1e2030;
    }
    [data-list-id^=forum-channel-list-] button[class^=submitButton-][class*=colorBrand] {
      background-color: #8aadf4;
      color: #181926;
    }

    div[class^=chat] > div[class^=content-] main[class^=chatContent-] + div[class^=container-] {
      background-color: var(--background-secondary);
    }

    [class*=channelTextAreaInnerError-] {
      border: 1px solid #f38ba8 !important;
    }

    div[class^=callContainer-] [class*=controlIcon-] {
      color: #b8c0e0;
    }
    div[class^=callContainer-] [class*=controlIcon-]:hover {
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class*=tile-],
    div[class^=callContainer-] div[class*=background-] {
      background-color: #24273a !important;
    }
    div[class^=callContainer-] div[class*=overlayTitle],
    div[class^=callContainer-] svg[class*=status-] {
      background-color: #363a4f;
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class*=header],
    div[class^=callContainer-] svg[class*=selectedIcon-] {
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class*=button-][class*=contents-],
    div[class^=callContainer-] button[class*=cta-],
    div[class^=callContainer-] button[class*=participantsButton-] {
      background-color: #363a4f;
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=children-] div[class*=playingText-] {
      color: #b8c0e0;
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=toolbar-] svg[class^=controlIcon-] {
      color: var(--interactive-normal);
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=toolbar-] div[class^=streamQualityIndicator-] div[class^=liveQualityIndicator-] {
      background-color: #494d64 !important;
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=toolbar-] div[class^=streamQualityIndicator-] div[class^=liveQualityIndicator-] div[class^=qualityIndicator-] {
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=toolbar-] div[class^=streamQualityIndicator-] div[class^=liveQualityIndicator-] svg[class^=premiumStreamIcon] {
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] div[class^=toolbar-] div[class^=liveIndicator-] div[class^=live-] {
      background-color: #ed8796 !important;
      color: #181926 !important;
    }
    div[class^=callContainer-] div[class^=videoControls-] button[class*=leftTrayIcon-][class*=buttonColor-] {
      background-color: #363a4f;
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=red-] {
      background: #ed8796;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=red-] [class*=centerIcon-] {
      color: #181926;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=primaryDark-] {
      background: #494d64;
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=primaryDark-] [class*=centerIcon-] {
      color: #cad3f5;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=white-] {
      color: #181926;
      background-color: #b8c0e0;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=white-] [class*=centerIcon-] {
      color: #181926;
    }
    div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=white-]:hover, div[class^=callContainer-] div[class^=videoControls-] [class*=colorable-][class*=white-][class*=active-] {
      background: #cad3f5;
    }

    div[class*=giftCodeContainer] [class*=tile] {
      background-color: #1e2030;
    }
    div[class*=giftCodeContainer] [class*=tile] > [class*=description] {
      color: #cad3f5;
    }

    div[class*=chat-] section[class*=header-] {
      background-color: #1e2030;
    }
    div[class*=chat-] div[class*=content-][class*=container-] {
      background-color: #1e2030;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=container] {
      background-color: #1e2030;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=search-] {
      background-color: #24273a !important;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=search-] input::placeholder {
      color: #6e738d;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=browser] div[class*=content] div[class^=container-] {
      background-color: #24273a;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=scrollerContainer-] {
      background-color: #1e2030;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[class*=scrollerContainer-] div[class*=checkIcon-][style*="opacity: 1;"] > svg > path {
      fill: #181926;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[role=tablist] {
      background-color: #1e2030;
      border-bottom: 2px solid #363a4f;
    }
    div[class*=chat-] div[class*=content-][class*=container-] div[role=tablist] [class*=textBadge-] {
      color: #181926;
    }

    div[class*=chat-] section[class*=title] div[class*=searchBar] span[class*=search] {
      background-color: #363a4f;
      color: #cad3f5;
    }
    div[class*=chat-] nav[class*=pageControl] div[class*=roundButton][class*=activeButton] span {
      color: #181926;
    }

    div[class*=chat-] li[class*=mainCard-][class*=container] {
      background-color: #363a4f;
    }
    div[class*=chat-] li[class*=mainCard-][class*=container]:hover {
      background-color: #494d64;
    }
    div[class*=chat-] li[class*=mainCard-][class*=container] div[class*=contentPreview-] {
      background-color: #24273a;
      border: none;
    }
    div[class*=chat-] li[class*=mainCard-][class*=container] div[class*=contentPreview-] div[class*=textContentFooter-] {
      background: none;
    }
    div[class*=chat-] li[class*=mainCard-][class*=container] div[class*=tags-] div[class*=tagPill-] {
      background-color: rgba(73, 77, 100, 0.8);
    }
    div[class*=chat-] div[class*=emptyPage] {
      background-color: #24273a;
    }
    div[class*=chat-] div[class*=innerHeader]:after {
      background: none;
    }

    [id*=message-accessories-] > [class*=invite-] {
      background-color: #24273a;
    }
    [id*=message-accessories-] > [class*=invite-] [class*=inFront-][class*=header-] {
      color: #a5adcb;
    }
    [id*=message-accessories-] > [class*=invite-] [class*=partyStatus-] {
      color: #cad3f5;
    }

    [class^=avatar-] [class^=dots-] {
      color: #24273a;
    }

    .messagelogger-deleted div {
      color: #ed8796 !important;
    }

    .messagelogger-deleted div a {
      color: #ea7183 !important;
    }

    div[class^=layerContainer] [role=menu] {
      --brand-experiment-560: var(--brand-experiment-25a);
      --brand-experiment-600: var(--brand-experiment);
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=colorBrand] {
      color: #8aadf4;
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=focused]:not([class*=colorDanger]),
    div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=focused] [class*=checkbox-] {
      color: var(--interactive-normal);
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger]):not([id*=user-context-user-volume]):hover {
      background: var(--background-accent);
      color: #181926;
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger]):not([id*=user-context-user-volume]):hover [class*=subtext],
    div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger]):not([id*=user-context-user-volume]):hover [class*=caret-] {
      color: #181926;
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault] [class*=caret] {
      color: #cad3f5;
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction-]) {
      color: var(--background-floating);
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction-]) [class*=check-] {
      color: var(--interactive-normal);
    }
    div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction-]) [class*=checkbox-] {
      color: var(--background-floating);
    }
    div[class^=layerContainer] [role=menu] [class*=focused] [class*=userMenuUsername] * {
      color: #181926;
    }
    div[class^=layerContainer] [role=menu] [class*=colorDanger][class*=focused],
    div[class^=layerContainer] [role=menu] [class*=colorDefault] [class*=check-] {
      color: var(--background-floating);
      background-color: #ed8796;
    }
    div[class^=layerContainer] [role=menu] #guild-header-popout-premium-subscribe div[class^=iconContainer-] > svg {
      color: #f5bde6;
    }
    div[class^=layerContainer] [role=menu] #user-context-user-volume div[class*=slider-] div[class*=bar-] {
      background-color: #363a4f;
    }

    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-]:not([class^=animatorBottom-]) > div div[class*=flowerStarContainer-] svg[class*=flowerStar-] *,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-]:not([class^=animatorBottom-]) > div div[class*=flowerStarContainer-] svg[class*=flowerStar-] * {
      fill: #8aadf4;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=countText],
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=countText] {
      color: #181926;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] svg[class*=activeIcon] circle,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] svg[class*=activeIcon] circle {
      fill: #181926;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] svg[class*=activeIcon] g path,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] svg[class*=activeIcon] g path {
      fill: #8aadf4;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] div[class*=autocompleteArrow-],
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] header,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] div[class*=autocompleteArrow-],
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] header {
      background-color: #1e2030;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] header > input::placeholder,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] header > input::placeholder {
      color: #8087a2;
    }
    .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] section,
    .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender-] div[class*=container] section {
      background-color: #24273a;
      color: #cad3f5;
    }

    div[class*=recentMentionsPopout] div[class|=header] div[class|=tabBar] div[class|=badge],
    div[class*=recentMentionsPopout] div[class|=header] div[class|=tabBar] div[class|=tab][class*=active-] {
      color: #24273a;
    }
    div[class*=recentMentionsPopout] div[class|=header] div[class|=controls-] {
      --background-secondary: #363a4f;
      --background-primary: rgba(54, 58, 79, 0.9);
    }
    div[class*=recentMentionsPopout] div[class^=scroller-] [role=button] {
      --background-tertiary: rgba(165, 173, 203, 0.15);
      --background-floating: rgba(165, 173, 203, 0.12);
    }
    div[class*=recentMentionsPopout] div[class^=scroller-] [role=button] div[class*=jumpButton-] {
      background-color: #363a4f;
    }

    div[class*=rolesList] div[class^=role-],
    div[class*=rolesList] button[class^=addButton-] {
      background-color: #26283d;
    }
    div[class*=rolesList] div[class^=role-] span[class^=roleCircle-][style*="background-color: rgb(185, 187, 190)"] {
      background-color: #a5adcb !important;
    }
    div[class*=rolesList] div[class^=role-] span[class^=roleCircle-][style*="background-color: rgb(54, 57, 62)"], div[class*=rolesList] div[class^=role-] span[class^=roleCircle-][style*="background-color: rgb(53, 57, 64)"] {
      background-color: #24273a !important;
    }

    div[class*=layerContainer] > div[class*=layer] div[class^=reactors] {
      background-color: var(--background-primary);
    }
    div[class*=layerContainer] > div[class*=layer] div[class*=reactorDefault] {
      -webkit-box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
      box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
    }
    div[class*=layerContainer] > div[class*=layer] div[class*=reactionSelected] {
      background-color: var(--background-modifier-selected);
    }
    div[class*=layerContainer] > div[class*=layer] div[class*=friendSelected] {
      background: #363a4f !important;
    }

    section[class^=positionContainer-] button[class*=navButtonActive] {
      background-color: #8aadf4;
      color: #181926;
    }

    .theme-light section[class^=positionContainer-] div[class^=categoryText-] {
      color: #24273a;
    }

    #emoji-picker-tab-panel [class*=stickerInspected-] [class*=inspectedIndicator],
    #emoji-picker-tab-panel [class^=emojiItem-][class*=emojiItemSelected-] {
      background-color: var(--brand-experiment-25a);
    }
    #emoji-picker-tab-panel [class*=newlyAddedHighlight-] {
      border: 1px solid #a6da95;
    }
    #emoji-picker-tab-panel [class*=newlyAddedHighlight-] ~ [class*=newlyAddedBadge-] {
      background: #a6da95 !important;
      color: #181926;
    }

    [class*=stickerInspected-] [class^=inspectedIndicator] {
      background-color: var(--brand-experiment-25a);
    }

    .theme-light > div[class^=focusLock] > div[class^=root] > div[class^=container] div[class*=footer][class*=footerSeparator-] {
      box-shadow: inset 0 1px 0 #363a4f;
      -webkit-box-shadow: inset 0 1px 0 #363a4f;
    }
    .theme-light > div[class^=focusLock] > div[class^=root] {
      box-shadow: 0 0 0 1px #363a4f, 0 2px 10px 0 hsla(0, calc(var(--saturation-factor, 1) * 0%), 0%, 0.1);
      -webkit-box-shadow: 0 0 0 1px #363a4f, 0 2px 10px 0 hsla(0, calc(var(--saturation-factor, 1) * 0%), 0%, 0.1);
    }
    .theme-light div[class|=focusLock] div[class|=downloadApps] {
      background-color: #24273a !important;
    }
    .theme-light div[class|=focusLock] div[class|=downloadApps] button[class|=modalCloseButton],
    .theme-light div[class|=focusLock] div[class|=downloadApps] h2,
    .theme-light div[class|=focusLock] div[class|=downloadApps] h3 {
      color: #cad3f5;
    }
    .theme-light div[class|=focusLock] div[class|=downloadApps] div[class*=footer-] {
      color: #cad3f5 !important;
      background-color: unset !important;
    }
    .theme-light div[class|=focusLock] div[class|=downloadApps] div[class*=footer-] a {
      color: #8aadf4;
    }
    .theme-light div[class|=focusLock] div[class|=downloadApps] li[class*=active-] a[class*=downloadButton-] {
      transition: all 0.3s ease-in-out;
      color: #24273a;
    }
    .theme-light[class*=profileColors-] [class*=userTagUsernameBase-],
    .theme-light[class*=profileColors-] [class*=discrimBase-],
    .theme-light[class*=profileColors-] [class*=title-],
    .theme-light[class*=profileColors-] [class*=roles-],
    .theme-light[class*=profileColors-] [class*=defaultColor-],
    .theme-light[class*=profileColors-] [class*=markup-],
    .theme-light[class*=profileColors-] [class*=activityUserPopoutV2-] *,
    .theme-light[class*=profileColors-] [class*=customStatus-],
    .theme-light[class*=profileColors-] [class*=section-],
    .theme-light[class*=profileColors-] [class*=additionalActionsIcon-],
    .theme-light[class*=profileColors-] [class*=overlayBackground-] * {
      --interactive-normal: #181926;
      --text-normal: #181926;
      --interactive-active: #181926;
      --interactive-hover: #181926;
    }
    .theme-light[class*=profileColors-] [class*=userTagUsernameBase-]:not(a),
    .theme-light[class*=profileColors-] [class*=discrimBase-]:not(a),
    .theme-light[class*=profileColors-] [class*=title-]:not(a),
    .theme-light[class*=profileColors-] [class*=roles-]:not(a),
    .theme-light[class*=profileColors-] [class*=defaultColor-]:not(a),
    .theme-light[class*=profileColors-] [class*=markup-]:not(a),
    .theme-light[class*=profileColors-] [class*=activityUserPopoutV2-] *:not(a),
    .theme-light[class*=profileColors-] [class*=customStatus-]:not(a),
    .theme-light[class*=profileColors-] [class*=section-]:not(a),
    .theme-light[class*=profileColors-] [class*=additionalActionsIcon-]:not(a),
    .theme-light[class*=profileColors-] [class*=overlayBackground-] *:not(a) {
      color: unset !important;
    }

    div[class^=layerContainer] #guild-header-popout,
    div[class^=layerContainer] #guild-context,
    div[class^=layerContainer] div[id^=channel-context],
    div[class^=layerContainer] div[id^=user-context] {
      background: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[role=listbox] {
      background-color: #1e2030;
    }
    div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[role=option][aria-selected=true] {
      background: #363a4f;
    }
    div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[role=option] svg[class*=selectedIcon] circle {
      fill: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[class*=queryText-] {
      color: #8087a2;
    }
    div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[class*=queryText-] strong {
      color: #cad3f5;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal-] {
      background-color: #1e2030;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal-] li,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal-] p,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal-] span,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize-] li,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize-] p,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize-] span,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal-] li,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal-] p,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal-] span {
      color: #cad3f5;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] {
      background-color: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] button[type=submit] span {
      color: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] [class*=footerText-] {
      color: #b8c0e0;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h1[class^=fixed-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h2[class^=fixed-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h3[class^=fixed-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h4[class^=fixed-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h5[class^=fixed-],
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h6[class^=fixed-] {
      color: #ed8796;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h1[class^=fixed-]:after,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h2[class^=fixed-]:after,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h3[class^=fixed-]:after,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h4[class^=fixed-]:after,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h5[class^=fixed-]:after,
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h6[class^=fixed-]:after {
      background-color: #ed8796;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=message-] {
      background-color: #363a4f;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityItem-] {
      background-color: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityItem-] div[class*=previewBadge-] {
      color: #181926;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityTag-] {
      background-color: #363a4f;
    }
    div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label="Manage Accounts"] div[class*=navRow-] {
      background-color: #1e2030;
    }
    div[class^=layerContainer] div[class^=addGamePopout-] {
      background-color: #1e2030;
    }
    div[class^=layerContainer] div[class*=searchOption-]::after,
    div[class^=layerContainer] div[class*=option-]::after,
    div[class^=layerContainer] li[class*=option-]::after {
      display: none;
    }
    div[class^=layerContainer] div[class^=queryContainer] {
      background-color: #181926;
    }
    div[class^=layerContainer] div[class^=queryContainer] span[class^=key] {
      color: #cad3f5;
      background-color: #24273a;
    }
    div[class^=layerContainer] [class*=tooltipBrand-],
    div[class^=layerContainer] [class*=tooltipRed-],
    div[class^=layerContainer] [class*=tooltipGreen-],
    div[class^=layerContainer] [class*=tooltipYellow] {
      color: #181926;
    }
    div[class^=layerContainer] div[class^=popout-] div[class^=row][role=button]:hover {
      color: #181926;
    }
    div[class^=layerContainer] div[class^=popout-] div[class^=row][role=button]:hover [class*=timestamp] {
      color: #181926;
    }

    form[class*=card-] {
      background-color: #24273a;
    }

    div[class*=userInfoSection-] div[class^=connectedAccountContainer-] {
      background-color: rgba(54, 58, 79, 0.45) !important;
    }

    div[class*=cardWarning-] div[class*=warning-] {
      color: #181926;
    }

    #emoji-picker-tab-panel,
    #sticker-picker-tab-panel {
      /* --background-floating: #363a4f;

        + div[class^="slotsContainer-"] {
          background-color: $surface0;
        }
      */
    }
    #emoji-picker-tab-panel div[class^=tooltipContainer-] label[class^=label-][class*=labelChecked-],
    #sticker-picker-tab-panel div[class^=tooltipContainer-] label[class^=label-][class*=labelChecked-] {
      background: -webkit-gradient(linear, right top, left top, from(#f5bde6), color-stop(33.33%, #c6a0f6), to(#8aadf4));
      background: linear-gradient(270deg, #f5bde6, #c6a0f6 33.33%, #8aadf4);
    }

    div[class*=keyboardShortcutsModal-] {
      background-color: #1e2030 !important;
    }
    div[class*=keyboardShortcutsModal-] div[class^=keybindShortcut-] span[class^=key-] {
      color: #181926;
    }
    div[class*=keyboardShortcutsModal-] div[class^=keybindShortcut-] span[class^=key-] svg g {
      fill: #181926 !important;
    }

    .react-datepicker,
    .react-datepicker__header {
      background-color: #1e2030 !important;
    }

    .react-datepicker__day {
      background-color: #181926 !important;
    }

    .react-datepicker__day:active {
      background: #8aadf4 !important;
    }

    .react-datepicker__day--selected:after {
      background-color: #8aadf4 !important;
    }

    [class^=datePickerHint-] [class^=hintValue-] {
      color: #181926 !important;
    }

    div[class*=layerContainer-] div[class^=control-] div[class*=checked-] {
      background-color: #a6da95 !important;
    }
    div[class*=layerContainer-] div[class^=control-] div[style*="background-color: rgb(114, 118, 125);"] {
      background-color: #5b6078 !important;
    }

    div[class*=layerContainer-] div[class*=guildPopout-][role=dialog] {
      background-color: #24273a;
    }
    div[class*=layerContainer-] div[class*=guildPopout-][role=dialog] div[class*=guildName-] {
      color: #cad3f5;
    }

    div[class*=layerContainer-] [role*=dialog] a[class*=downloadLink-] {
      color: #8087a2 !important;
      opacity: 1;
    }
    div[class*=layerContainer-] [role*=dialog] a[class*=downloadLink-]:hover {
      color: #cad3f5 !important;
    }

    div[class*=userPopoutOuter-] div[aria-label="HypeSquad Bravery"] img,
    div[class*=userProfileOuter-] div[aria-label="HypeSquad Bravery"] img {
      content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m5.01502 4h13.97008c.1187 0 .215.09992.215.22305v9.97865c0 .0697-.0312.1343-.0837.1767l-6.985 5.5752c-.0389.0313-.0847.0464-.1314.0464-.0466 0-.0924-.0151-.1313-.0464l-6.985-5.5752c-.05252-.0424-.08365-.107-.08365-.1767v-9.97865c0-.12313.0963-.22305.21497-.22305zm7.82148 7.0972 4.1275-2.71296c.1039-.06863.2299.04542.1725.15644l-1.7114 3.36192c-.0403.0807.0182.1756.1079.1756h1.0246c.118 0 .1664.1504.0706.219l-4.6267 3.3175c-.0414.0303-.0978.0303-.1402 0l-4.6267-3.3175c-.0948-.0686-.04639-.219.07059-.219h1.02356c.09076 0 .14925-.0949.10791-.1756l-1.71132-3.36293c-.05648-.11001.06958-.22305.17345-.15543l4.12851 2.71296c.0716.0474.1291.112.1674.1887l.6293 1.2636c.0444.0888.1714.0888.2158 0l.6293-1.2636c.0383-.0767.0958-.1423.1674-.1887z' fill='%23c6a0f6' fill-rule='evenodd'/%3E%3C/svg%3E");
    }
    div[class*=userPopoutOuter-] div[aria-label="HypeSquad Balance"],
    div[class*=userProfileOuter-] div[aria-label="HypeSquad Balance"] {
      content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m11.8622 4.05696c.076-.07595.1996-.07595.2756 0l7.8048 7.80474c.0371.0362.0574.0865.0574.1377 0 .0513-.0212.1016-.0574.1378l-7.8048 7.8047c-.038.038-.0883.0574-.1378.0574s-.0998-.0194-.1378-.0574l-7.8048-7.8047c-.03709-.0362-.0574-.0857-.0574-.1378s.02031-.1015.0574-.1377zm.9299 8.29474 3.6146-2.37377c.0909-.05917.2013.03977.151.13597l-1.4986 2.9416c-.0354.0707.0158.1537.0944.1537h.8973c.1033 0 .1457.1316.0618.1916l-4.0517 2.9028c-.0362.0265-.0856.0265-.1227 0l-4.05168-2.9028c-.08301-.06-.04062-.1916.06182-.1916h.89634c.07948 0 .1307-.083.09449-.1537l-1.49862-2.9416c-.04945-.0962.06094-.19514.1519-.13597l3.61545 2.37377c.0627.0415.113.098.1465.1651l.5511 1.1057c.0389.0777.1501.0777.189 0l.551-1.1057c.0336-.0671.0839-.1245.1466-.1651z' fill='%238bd5ca' fill-rule='evenodd'/%3E%3C/svg%3E");
    }
    div[class*=userPopoutOuter-] div[aria-label="HypeSquad Brilliance"],
    div[class*=userProfileOuter-] div[aria-label="HypeSquad Brilliance"] {
      content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m12 20c4.4183 0 8-3.5817 8-8 0-4.41828-3.5817-8-8-8-4.41828 0-8 3.58172-8 8 0 4.4183 3.58172 8 8 8zm.7921-8.275 3.6146-2.3738c.0909-.05916.2013.03974.151.136l-1.4986 2.9416c-.0354.0707.0158.1537.0944.1537h.8973c.1033 0 .1457.1315.0618.1916l-4.0517 2.9027c-.0362.0265-.0856.0265-.1227 0l-4.05168-2.9027c-.08301-.0601-.04062-.1916.06182-.1916h.89634c.07948 0 .1307-.083.09449-.1537l-1.49862-2.9416c-.04945-.09626.06094-.19516.1519-.136l3.61545 2.3738c.0627.0415.113.098.1465.1651l.5511 1.1057c.0389.0777.1501.0777.189 0l.551-1.1057c.0336-.0671.0839-.1245.1466-.1651z' fill='%23ed8796' fill-rule='evenodd'/%3E%3C/svg%3E");
    }
    div[class*=userPopoutOuter-] div[aria-label="Active Developer"],
    div[class*=userProfileOuter-] div[aria-label="Active Developer"] {
      content: url("data:image/svg+xml,%3Csvg width='24' height='24' viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M6.47213 4L4 6.47213V17.5279L6.47217 20H17.5278L20 17.5279V6.47213L17.5279 4H6.47213ZM10.8582 16.4255H8.64551C8.64551 14.5952 7.1567 13.1064 5.32642 13.1064V10.8936C7.1567 10.8936 8.64551 9.40483 8.64551 7.57454H10.8582C10.8582 9.39042 9.96684 10.9908 8.61129 12C9.96684 13.0093 10.8582 14.6096 10.8582 16.4255ZM18.6667 13.1064C16.8364 13.1064 15.3476 14.5952 15.3476 16.4255H13.1348C13.1348 14.6096 14.0263 13.0093 15.3818 12C14.0263 10.9908 13.1348 9.39042 13.1348 7.57454H15.3476C15.3476 9.40483 16.8364 10.8936 18.6667 10.8936V13.1064V13.1064Z' fill='%23a6da95'/%3E%3C/svg%3E");
    }
    div[class*=userPopoutOuter-] div[aria-label="Early Verified Bot Developer"],
    div[class*=userProfileOuter-] div[aria-label="Early Verified Bot Developer"] {
      content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='m21.58 11.4-4.28-7.39-.35-.6h-9.91l-.35.6-4.27 7.39-.35.6.35.6 4.27 7.39.35.6h9.92l.35-.6 4.28-7.39.35-.6zm-13.07-1.03-1.63 1.63 1.63 1.63v2.73l-4.36-4.36 4.37-4.37v2.74zm3.12 6.93-2.04-.63 3.1-9.98 2.04.64zm3.86-.93v-2.73l1.63-1.64-1.63-1.63v-2.74l4.36 4.37z' fill='%238aadf4'/%3E%3C/svg%3E");
    }
    div[class*=userPopoutOuter-] div[class^=userPopoutOverlayBackground] > div[class^=scroller] > div[class^=section]:first-child > div[class^=buttonsContainer] > button:nth-child(2),
    div[class*=userProfileOuter-] div[class^=userPopoutOverlayBackground] > div[class^=scroller] > div[class^=section]:first-child > div[class^=buttonsContainer] > button:nth-child(2) {
      background: #8aadf4;
    }

    [class*=layerContainer-] [class*=toolbar-] {
      background-color: var(--background-floating);
    }
    [class*=layerContainer-] [class*=toolbar-] [class*=buttons-] [class*=icon-] {
      color: #cad3f5;
    }

    [class*=layerContainer-] div[id=sort-and-view] div[id=sort-and-view-reset-all] [style="color: var(--text-normal);"]:hover {
      color: #181926 !important;
    }

    rect[fill="#23a55a"],
    foreignObject[mask="url(#svg-mask-status-online)"] > div,
    div[class^=dotOnline],
    i[class^=statusOnline-] {
      fill: #a6da95 !important;
      background-color: #a6da95 !important;
    }

    rect[fill="rgba(35, 165, 90, 1)"] {
      fill: #a6da95 !important;
    }

    rect[fill="#f0b232"],
    foreignObject[mask="url(#svg-mask-status-idle)"] > div {
      fill: #eed49f !important;
      background-color: #eed49f !important;
    }

    rect[fill="rgba(240, 178, 50, 1)"] {
      fill: #eed49f !important;
    }

    rect[fill="#f23f43"],
    foreignObject[mask="url(#svg-mask-status-dnd)"] > div {
      fill: #ed8796 !important;
      background-color: #ed8796 !important;
    }

    rect[fill="rgba(242, 63, 67, 1)"] {
      fill: #ed8796 !important;
    }

    rect[fill="#82858f"],
    foreignObject[mask="url(#svg-mask-status-offline)"] > div,
    foreignObject[mask="url(#svg-mask-status-offline)"] > rect,
    div[class^=dotOffline],
    i[class^=statusOffline-] {
      fill: #a5adcb !important;
      background-color: #a5adcb !important;
    }

    rect[fill="rgba(130, 133, 143, 1)"] {
      fill: #a5adcb !important;
    }

    rect[fill="#593695"] {
      fill: #c6a0f6 !important;
    }

    .vc-platform-indicator svg[fill*="--green-"] {
      fill: #a6da95;
    }

    .vc-platform-indicator svg[fill*="--yellow-"] {
      fill: #eed49f;
    }

    .vc-platform-indicator svg[fill*="--red-"] {
      fill: #ed8796;
    }

    .vc-platform-indicator svg[fill*="--primary-400"] {
      fill: #a5adcb;
    }

    [src="/assets/eaeac24163b35f7526704a3d9b3c7722.svg"] {
      width: 0 !important;
      padding: 12px;
      height: 0 !important;
      -webkit-mask-image: url("https://discord.com/assets/eaeac24163b35f7526704a3d9b3c7722.svg");
      -webkit-mask-repeat: no-repeat;
      -webkit-mask-size: contain;
      background: #a6da95;
    }

    .vc-user-connection [src="/assets/eaeac24163b35f7526704a3d9b3c7722.svg"] {
      padding: 16px;
    }

    svg[class^=cursorDefault-] svg[class^=dots-] circle {
      fill: #24273a !important;
    }

    [style*="background-color: hsl(235, calc(var(--saturation-factor, 1) * 85.6%), 64.7%)"] {
      background-color: #8aadf4 !important;
      color: #181926;
    }

    span[class*=username-][style*="color: rgb(54, 57, 62)"],
    span[class*=username-][style*="color: rgb(53, 57, 64)"] {
      color: var(--background-primary) !important;
    }

    div[class*=flowerStarContainer-][class*=boostedGuildTierIconBackgroundWithVisibleBanner] svg[class*=flowerStar-] * {
      fill: #fff;
    }
    div[class*=flowerStarContainer-][class*=boostedGuildTierIconBackgroundWithVisibleBanner] div[class^=childContainer-] svg * {
      fill: #181926;
    }
    div[class*=flowerStarContainer-][class*=iconBackgroundTierOne-] svg[class*=flowerStar-] *, div[class*=flowerStarContainer-][class*=iconBackgroundTierTwo-]:not([class*=boostedGuildTierIconBackgroundWithVisibleBanner]) svg[class*=flowerStar-] * {
      fill: #5b6078;
    }
    div[class*=flowerStarContainer-][class*=iconBackgroundTierOne-] div[class^=childContainer-] svg *, div[class*=flowerStarContainer-][class*=iconBackgroundTierTwo-]:not([class*=boostedGuildTierIconBackgroundWithVisibleBanner]) div[class^=childContainer-] svg * {
      fill: #cad3f5;
    }
    div[class*=flowerStarContainer-][class*=iconBackgroundTierThree-] svg[class*=flowerStar-] * {
      fill: #f5bde6;
    }
    div[class*=flowerStarContainer-][class*=iconBackgroundTierThree-] div[class^=childContainer-] svg * {
      fill: #181926;
    }
    div[class*=flowerStarContainer-][class*=verified-] svg[class*=flowerStar-] * {
      fill: #a6da95;
    }
    div[class*=flowerStarContainer-][class*=verified-] div[class^=childContainer-] svg * {
      fill: #181926;
    }
    div[class*=flowerStarContainer-][class*=partnered-] svg[class*=flowerStar-] * {
      fill: #8aadf4;
    }
    div[class*=flowerStarContainer-][class*=partnered-] div[class^=childContainer-] svg * {
      fill: #181926;
    }

    div[class^=communityInfoPill] {
      --background-accent: rgba(36, 39, 58, 0.7);
      color: #cad3f5;
    }
    div[class^=communityInfoPill] div[class^=text] {
      font-weight: 500;
    }

    a[class*=socialLink-][href*=discord] {
      color: #a5adcb;
    }

    svg[class^=uploadIcon] {
      color: #181926;
    }

    .theme-dark h2[class^=emptyStateHeader-],
    .theme-light h2[class^=emptyStateHeader-] {
      color: #cad3f5;
    }
    .theme-dark p[class^=emptyStateSubtext-],
    .theme-light p[class^=emptyStateSubtext-] {
      color: #a5adcb;
    }

    div[class*=unreadMentionsBar-],
    div[class*=unreadBar-] {
      color: #181926;
    }

    div[class|=numberBadge] {
      font-weight: 700;
      color: #181926;
    }

    div[class|=newChannel] {
      color: #181926;
      background-color: #8aadf4;
    }

    div[class|=botTag] {
      background-color: #8aadf4;
    }

    button[class^=attachButton-] svg path[class^=attachButtonPlay-] {
      color: #a6da95;
      fill: #a6da95;
    }

    div[class*=avatarSpeaking-] {
      -webkit-box-shadow: inset 0 0 0 2px #a6da95, inset 0 0 0 3px var(--background-secondary);
      box-shadow: inset 0 0 0 2px #a6da95, inset 0 0 0 3px var(--background-secondary);
    }

    div[class*=videoLayer-] > div[class^=tileChild] > div[class^=border][class*=speaking-] {
      -webkit-box-shadow: inset 0 0 0 2px #a6da95, inset 0 0 0 3px #a6da95;
      box-shadow: inset 0 0 0 2px #a6da95, inset 0 0 0 3px #a6da95;
    }
    div[class*=videoLayer-] > div[class^=tileChild] > div[class^=border][class*=voiceChannelEffect-] {
      -webkit-box-shadow: inset 0 0 0 2px #8aadf4, inset 0 0 0 3px #8aadf4;
      box-shadow: inset 0 0 0 2px #8aadf4, inset 0 0 0 3px #8aadf4;
    }

    div[class*=featureIcon-] path {
      fill: #8aadf4;
    }

    div[class*=backgroundAccent-] {
      color: #181926;
    }

    div[class*=profileBadges-] div[aria-label="Supports Commands"] img {
      content: url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23a6da95'%3E%3Cpath d='m8.1176653 16.0847263 4.8330812-8.1694527h2.9315882l-4.8330812 8.1694527z'/%3E%3Cpath d='m20.4189453 9.4038086v-2.4311524c0-1.9775391-1.0825195-3.1118164-2.9697266-3.1118164h-1.5581055v1.7802734l.9594727-.0014648c.8540039 0 1.34375.5683594 1.34375 1.5585938v2.3969727c0 .8300781.1806641 1.8422852 1.5893555 2.3100586l.2856445.0947265-.2856445.0947266c-1.4086914.4677734-1.5893555 1.4799804-1.5893555 2.3100586v2.3964844c0 .9907227-.4897461 1.559082-1.34375 1.559082l-.9594727-.0014648v1.7802734h1.5581055c1.887207 0 2.9697266-1.1342773 2.9697266-3.1118164v-2.4316406c0-1.2583008.3432617-1.6264648 1.5810547-1.6445312v-1.9023438c-1.237793-.0180665-1.5810547-.3862305-1.5810547-1.6450196z'/%3E%3Cpath d='m5.8061523 7.1982422c0-.9760742.5024414-1.5585938 1.3432617-1.5585938l.9594727.0014648v-1.7802734h-1.5576172c-1.887207 0-2.9697266 1.1342773-2.9697266 3.1118164v2.4311523c0 1.2587891-.3432617 1.6269531-1.581543 1.6450195v1.9023438c1.2382812.0180664 1.581543.3862305 1.581543 1.6445312v2.4316406c0 1.9775391 1.0825195 3.1118164 2.9697266 3.1118164h1.5576172v-1.7802734l-.9594727.0014648c-.8408203 0-1.3432617-.5830078-1.3432617-1.559082v-2.3964844c0-.8300781-.1806641-1.8422852-1.5898438-2.3100586l-.2856444-.0947264.2856445-.0947266c1.4091797-.4677734 1.5898437-1.4799804 1.5898437-2.3100586z'/%3E%3C/g%3E%3C/svg%3E");
    }

    div[class*=newBadge-],
    div[class*=tryItOutBadge-] {
      color: #181926;
    }

    span[class*=channelMention]:hover,
    [class*=mention]:not([class*=mentionButton-],
    [class*=mentionIcon-]):hover {
      color: #181926;
    }

    .theme-dark code.hljs {
      color: #cad3f5;
      background: #24273a;
    }
    .theme-dark code .hljs-keyword {
      color: #c6a0f6;
    }
    .theme-dark code .hljs-built_in {
      color: #ed8796;
    }
    .theme-dark code .hljs-type {
      color: #eed49f;
    }
    .theme-dark code .hljs-literal {
      color: #f5a97f;
    }
    .theme-dark code .hljs-number {
      color: #f5a97f;
    }
    .theme-dark code .hljs-operator {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-punctuation {
      color: #b8c0e0;
    }
    .theme-dark code .hljs-property {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-regexp {
      color: #f5bde6;
    }
    .theme-dark code .hljs-string {
      color: #a6da95;
    }
    .theme-dark code .hljs-char.escape_ {
      color: #a6da95;
    }
    .theme-dark code .hljs-subst {
      color: #a5adcb;
    }
    .theme-dark code .hljs-symbol {
      color: #f0c6c6;
    }
    .theme-dark code .hljs-variable {
      color: #c6a0f6;
    }
    .theme-dark code .hljs-variable.language_ {
      color: #c6a0f6;
    }
    .theme-dark code .hljs-variable.constant_ {
      color: #f5a97f;
    }
    .theme-dark code .hljs-title {
      color: #8aadf4;
    }
    .theme-dark code .hljs-title.class_ {
      color: #eed49f;
    }
    .theme-dark code .hljs-title.function_ {
      color: #8aadf4;
    }
    .theme-dark code .hljs-params {
      color: #cad3f5;
    }
    .theme-dark code .hljs-comment {
      color: #5b6078;
    }
    .theme-dark code .hljs-doctag {
      color: #ed8796;
    }
    .theme-dark code .hljs-meta {
      color: #f5a97f;
    }
    .theme-dark code .hljs-section {
      color: #8aadf4;
    }
    .theme-dark code .hljs-tag {
      color: #a5adcb;
    }
    .theme-dark code .hljs-name {
      color: #c6a0f6;
    }
    .theme-dark code .hljs-attr {
      color: #8aadf4;
    }
    .theme-dark code .hljs-attribute {
      color: #a6da95;
    }
    .theme-dark code .hljs-bullet {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-code {
      color: #a6da95;
    }
    .theme-dark code .hljs-emphasis {
      color: #ed8796;
      font-style: italic;
    }
    .theme-dark code .hljs-strong {
      color: #ed8796;
      font-weight: bold;
    }
    .theme-dark code .hljs-formula {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-link {
      color: #7dc4e4;
      font-style: italic;
    }
    .theme-dark code .hljs-quote {
      color: #a6da95;
      font-style: italic;
    }
    .theme-dark code .hljs-selector-tag {
      color: #eed49f;
    }
    .theme-dark code .hljs-selector-id {
      color: #8aadf4;
    }
    .theme-dark code .hljs-selector-class {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-selector-attr {
      color: #c6a0f6;
    }
    .theme-dark code .hljs-selector-pseudo {
      color: #8bd5ca;
    }
    .theme-dark code .hljs-template-tag {
      color: #f0c6c6;
    }
    .theme-dark code .hljs-template-variable {
      color: #f0c6c6;
    }
    .theme-dark code .hljs-diff-addition {
      color: #a6da95;
      background: rgba(var(--ctp-green), 15%);
    }
    .theme-dark code .hljs-diff-deletion {
      color: #ed8796;
      background: rgba(var(--ctp-red), 15%);
    }
  '';
}

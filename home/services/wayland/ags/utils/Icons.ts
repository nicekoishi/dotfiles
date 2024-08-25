/* There's a script that resolves this path to the final one, but it should be ../assets */
App.addIcons("assets");

export default {
    nix: "nix-snowflake-white-symbolic",
    audio: {
        microphone: {
            high: "microphone-sensitivity-high-symbolic",
            medium: "microphone-sensitivity-medium-symbolic",
            low: "microphone-sensitivity-low-symbolic",
            muted: "microphone-sensitivity-muted-symbolic",
        },
        speaker: {
            muted: "audio-volume-muted-symbolic",
            low: "audio-volume-low-symbolic",
            medium: "audio-volume-medium-symbolic",
            high: "audio-volume-high-symbolic",
            overamplified: "audio-volume-overamplified-symbolic",
        },
    },
    wm: {
        screencast: {
            window: "video-single-display-symbolic",
            monitor: "video-display-symbolic",
        },
        workspaces: {
            1: "firefox-symbolic",
            2: "org.gnome.Terminal-symbolic",
            3: "contact-new-symbolic",
            4: "multimedia-audio-player-symbolic",
            5: "computer-symbolic",
            6: "workspace-switcher-symbolic",
        },
    },
};

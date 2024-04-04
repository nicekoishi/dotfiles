import { Audio, Utils, Widget } from "../../../imports.js";
import { audioIcon, micIcon } from "../../../utils/audio.js";
const { Box, Button, Icon, Label } = Widget;

const speakerVol = () =>
    Box({
        children: [
            Icon({
                className: "volSpkIcon",
                setup: (self) => {
                    self.hook(Audio, audioIcon, "speaker-changed");
                },
            }),

            Label({
                className: "volSpkLabel",
                setup: (self) => {
                    self.hook(Audio, audioIcon, "speaker-changed");
                },
            }),
        ],
    });

const micVol = () =>
    Box({
        children: [
            Icon({
                className: "volMicIcon",
                setup: (self) => {
                    self.hook(Audio, micIcon, "microphone-changed");
                },
            }),
            Label({
                className: "volMicLabel",
                setup: (self) => {
                    self.hook(Audio, micIcon, "microphone-changed");
                },
            }),
        ],
    });

export const Volume = () =>
    Box({
        className: "volumeBox",
        children: [
            Button({
                className: "volSpkBtn",
                child: speakerVol(),
                cursor: "pointer",
                onClicked: () => (Audio.speaker.is_muted = !Audio.speaker.is_muted),
                onSecondaryClick: () => Utils.execAsync("pavucontrol"),
                onScrollUp: () => (Audio.speaker.volume += 0.05),
                onScrollDown: () => (Audio.speaker.volume -= 0.05),
            }),
            Button({
                className: "volMicBtn",
                child: micVol(),
                cursor: "pointer",
                onClicked: () =>
                    (Audio.microphone.is_muted = !Audio.microphone.is_muted),

                onScrollUp: () => (Audio.microphone.volume += 0.05),
                onScrollDown: () => (Audio.microphone.volume -= 0.05),
            }),
        ],
    });

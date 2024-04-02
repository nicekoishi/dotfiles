import { Audio, Utils, Widget } from "../../../imports.js";
import { audioIcon, micIcon } from "../../../utils/audio.js";
const { Box, Button, Icon, Label } = Widget;

const speakerVol = () =>
    Box({
        children: [
            Icon({
                setup: (self) => {
                    self.hook(Audio, audioIcon, "speaker-changed");
                },
            }),

            Label({
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
                setup: (self) => {
                    self.hook(Audio, micIcon, "microphone-changed");
                },
            }),
            Label({
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
                className: "volumeSpeakerBtn",
                child: speakerVol(),
                onClicked: () => (Audio.speaker.is_muted = !Audio.speaker.is_muted),
                onSecondaryClick: () => Utils.execAsync("pavucontrol"),
                onScrollUp: () => (Audio.speaker.volume += 0.05),
                onScrollDown: () => (Audio.speaker.volume -= 0.05),
            }),
            Button({
                className: "volumeMicBtn",
                child: micVol(),
                onClicked: () =>
                    (Audio.microphone.is_muted = !Audio.microphone.is_muted),

                onScrollUp: () => (Audio.microphone.volume += 0.05),
                onScrollDown: () => (Audio.microphone.volume -= 0.05),
            }),
        ],
    });

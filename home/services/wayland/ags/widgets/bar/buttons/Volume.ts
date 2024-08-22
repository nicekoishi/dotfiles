/* eslint-disable-next-line max-len */
// https://github.com/Aylur/dotfiles/blob/18b83b2d2c6ef2b9045edefe49a66959f93b358a/ags/widget/bar/buttons/SystemIndicators.ts#L76

import LaunchApp from "utils/LaunchApp";
import { micIcon, spkIcon } from "utils/Audio";

const Audio = await Service.import("audio");
const { Box, Button, Icon } = Widget;

const Speaker = () =>
    Box({
        className: "volume-speaker",
        children: [
            Icon({
                setup: (self) => self.hook(Audio.speaker, spkIcon),
            }),
        ],
    });

const Microphone = () =>
    Box({
        className: "volume-microphone",
        children: [
            Icon({
                setup: (self) => self.hook(Audio.microphone, micIcon),
            }),
        ],
    });
export default () =>
    Button({
        onPrimaryClick: () => (Audio.speaker.is_muted = !Audio.speaker.is_muted),
        onSecondaryClick: () =>
            (Audio.microphone.is_muted = !Audio.microphone.is_muted),
        onMiddleClick: () => LaunchApp(["pwvucontrol"]),
        child: Box({
            className: "volumeBox",
            homogeneous: true,
            vertical: true,
            children: [Speaker(), Microphone()],
        }),
    });

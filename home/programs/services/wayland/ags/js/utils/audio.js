import { Audio, Icons } from "../imports.js";

export const audioIcon = (self) => {
    self.label = `${Math.round(Audio.speaker?.volume * 100)}`;
    const { muted, low, medium, high, overamplified } = Icons.volume;

    if (Audio.speaker.is_muted)
        return (self.icon = muted);

    const icon = [
        [101, overamplified],
        [67, high],
        [34, medium],
        [1, low],
        [0, muted],
    ];

    self.icon = icon.find(([n]) => n <= self.label)?.[1] || "";
};

export const micIcon = (self) => {
    self.label = `${Math.round(Audio.microphone?.volume * 100)}`;
    const { muted, low, medium, high } = Icons.microphone;

    if (Audio.microphone.is_muted)
        return (self.icon = muted);

    const icon = [
        [67, high],
        [34, medium],
        [1, low],
        [0, muted],
    ];

    self.icon = icon.find(([n]) => n <= self.label)?.[1] || "";
};

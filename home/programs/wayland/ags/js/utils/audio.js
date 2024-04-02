import { Audio, Icons } from "../imports.js";

export const audioIcon = () => {
    const vol = Audio.speaker?.volume * 100;
    const icon =
    [
        [101, "overamplified"],
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "muted"],
    ].find(
        ([threshold]) => typeof threshold === "number" && threshold <= vol,
    )?.[1] ?? "muted";

    return Icons.volume[icon];
};

export const micIcon = () => {
    const vol = Audio.microphone?.volume * 100;
    const icon =
    [
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "muted"],
    ].find(
        ([threshold]) => typeof threshold === "number" && threshold <= vol,
    )?.[1] ?? "muted";

    return Icons.microphone[icon];
};

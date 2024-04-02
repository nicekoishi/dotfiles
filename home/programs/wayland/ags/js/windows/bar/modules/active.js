import { Hyprland, Widget } from "../../../imports.js";
const { Box, Label } = Widget;

export const Title = () =>
    Label({
        className: "currentTitle",
        label: Hyprland.active.client.bind("title"),
        truncate: "end",
        wrap: true,
        maxWidthChars: 35,
    });

export const ActiveTitle = () =>
    Box({
        className: "currentActive",
        children: [Title()],
    });

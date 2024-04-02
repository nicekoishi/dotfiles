import { Widget } from "../../imports.js";
const { Window, Box, CenterBox } = Widget;

import { Date } from "./modules/date.js";
import { ActiveTitle } from "./modules/active.js";
import { Workspaces } from "./modules/workspaces.js";
import { Volume } from "./modules/volume.js";

const Top = () =>
    Box({
        className: "barTop",
        hpack: "start",
        children: [ActiveTitle()],
    });

const Center = () =>
    Box({
        className: "barCenter",
        spacing: 8,
        vertical: false,
        children: [Workspaces()],
    });

const Bottom = () =>
    Box({
        className: "barBottom",
        hpack: "end",
        children: [
            Box({
                children: [Volume()],
            }),
            Date(),
        ],
    });

export const Bar = ({ monitor } = {}) =>
    Window({
        name: "bar",
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        margins: [4, 4, 0, 4],
        monitor,
        child: CenterBox({
            startWidget: Top(),
            centerWidget: Center(),
            endWidget: Bottom(),
        }),
    });

import { Widget } from "../../imports.js";
const { Window, Box, CenterBox } = Widget;

import { ActiveTitle } from "./modules/active.js";
import { Date } from "./modules/date.js";
import { NetWidget } from "./modules/network.js";
import { Tray } from "./modules/tray.js";
import { Volume } from "./modules/volume.js";
import { Workspaces } from "./modules/workspaces.js";

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
            Tray(),
            Box({
                children: [Volume(), NetWidget()],
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

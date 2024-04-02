import { Widget } from "../../imports.js";
const { Window, Box } = Widget;

import { Date } from "./modules/date.js";

const Center = () =>
    Box({
        className: "barCenter",
        children: [Date()],
    });

export const Bar = ({ monitor } = {}) =>
    Window({
        name: "bar",
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        monitor,
        child: Center(),
    });

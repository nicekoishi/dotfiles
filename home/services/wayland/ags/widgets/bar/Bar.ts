import Clock from "./buttons/Clock";
import Menu from "./buttons/Menu";
import Tray from "./buttons/Tray";
import Workspaces from "./buttons/Workspaces";
import Volume from "./buttons/Volume";

const { Box, CenterBox, Window } = Widget;

const Top = () =>
    Box({
        className: "barTop",
        vertical: true,
        vpack: "start",
        children: [Workspaces()],
    });

const End = () =>
    Box({
        className: "barBottom",
        vertical: true,
        vpack: "end",
        children: [Tray(), Volume(), Clock(), Menu()],
    });

export default (monitor: number) =>
    Window({
        monitor,
        name: `bar${monitor}`,
        anchor: ["top", "bottom", "left"],
        margins: [8, 4, 8, 8],
        exclusivity: "exclusive",
        child: CenterBox({
            className: "bar",
            vertical: true,
            startWidget: Top(),
            endWidget: End(),
        }),
    });

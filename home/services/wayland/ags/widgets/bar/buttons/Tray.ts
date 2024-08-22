import TrayItems from "utils/Tray";

const Tray = await Service.import("systemtray");
const { Box } = Widget;

export default () =>
    Box({
        className: "tray",
        children: [
            Box({
                vertical: true,
                className: "trayIcons",
                setup: (self) => {
                    self.hook(Tray, TrayItems);
                },
            }),
        ],
    });

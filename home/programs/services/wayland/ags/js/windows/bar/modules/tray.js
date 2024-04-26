import { Widget, SystemTray } from "../../../imports.js";
import { trayItems } from "../../../utils/tray.js";
const { Box } = Widget;

const TrayItems = () =>
    Box({
        className: "trayIcons",
        setup: (self) => {
            self.hook(SystemTray, trayItems);
        },
    });

export const Tray = () =>
    Box({
        className: "tray",
        vertical: true,
        children: [
            Box({
                child: TrayItems(),
            }),
        ],
    });

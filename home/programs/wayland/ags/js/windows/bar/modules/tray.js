import { App, Icons, Widget, SystemTray } from "../../../imports.js";
import { trayItems } from "../../../utils/tray.js";
const { Box, Button, EventBox, Icon, Window } = Widget;

const { arrowUp, arrowDown } = Icons.common;

const TrayIcon = () =>
    Icon({
        className: "trayChevron",
        icon: arrowDown,
    });

const TrayItems = () =>
    Box({
        className: "trayIcons",
        setup: (self) => {
            self.hook(SystemTray, trayItems);
        },
    });

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const TrayWindow = ({ monitor } = {}) =>
    Window({
        name: "trayWindow",
        anchor: ["top", "right"],
        visible: false,
        monitor,
        child: TrayItems(),
    });

export const Tray = () =>
    EventBox({
        onPrimaryClick: (self) => {
            self.child.children[0].icon = self.child.children[1].revealChild
                ? arrowDown
                : arrowUp;
            self.child.children[1].revealChild = !self.child.children[1].revealChild;
        },
        child: Box({
            className: "tray",
            vertical: true,
            children: [
                Button({
                    child: TrayIcon(),
                    onClicked: () => App.toggleWindow("trayWindow"),
                }),
            ],
        }),
    });

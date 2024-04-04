import { App, Notifications } from "./js/imports.js";

import { Bar } from "./js/windows/bar/index.js";
import { NotificationPopup } from "./js/windows/notifications/index.js";
import { Media } from "./js/windows/music/index.js";
import { TimeCalendar } from "./js/windows/bar/modules/date.js";

App.connect("config-parsed", () => print("config parsed"));

Notifications.popupTimeout = 5000;
Notifications.forceTimeout = false;
Notifications.cacheAction = true;

function addWindows(windows) {
    windows.forEach((win) => App.addWindow(win));
}

addWindows([Bar(), NotificationPopup(), Media(), TimeCalendar()]);

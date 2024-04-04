import { App, Notifications /*, Utils*/ } from "./js/imports.js";

import { Bar } from "./js/windows/bar/index.js";
import { NotificationPopup } from "./js/windows/notifications/index.js";
import { Media } from "./js/windows/music/index.js";
import { TimeCalendar } from "./js/windows/bar/modules/date.js";

const css = App.configDir + "/style.css";

App.connect("config-parsed", () => print("config parsed"));

App.config({
    style: css,
});

//function reloadCss() {
//    print("css change detected");
//    App.resetCss();
//    App.applyCss(css);
//}

//Utils.monitorFile(css, reloadCss);

Notifications.popupTimeout = 5000;
Notifications.forceTimeout = false;
Notifications.cacheAction = true;

function addWindows(windows) {
    windows.forEach((win) => App.addWindow(win));
}

addWindows([Bar(), NotificationPopup(), Media(), TimeCalendar()]);

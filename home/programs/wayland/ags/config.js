import { App } from "./js/imports.js";

import { Bar } from "./js/windows/bar/index.js";
import { TrayWindow } from "./js/windows/bar/modules/tray.js";
App.connect("config-parsed", () => print("config parsed"));

function addWindows(windows) {
    windows.forEach((win) => App.addWindow(win));
}

addWindows([Bar(), TrayWindow()]);

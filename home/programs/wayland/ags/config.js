import { App, Widget } from "./js/imports.js";
const leLabel = Widget.Label({
    label: "example",
});
const leBar = Widget.Window({
    name: "bar",
    anchor: ["top", "left", "right"],
    child: leLabel,
});

App.config({
    windows: [
    // definitions
        [leBar],
    ],
});

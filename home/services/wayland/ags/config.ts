import Bar from "widgets/bar/Bar";
import NotificationPopups from "widgets/notifications/Notifications";

App.config({
    onConfigParsed: () => {
        console.log("config parsed!");
    },
    windows: [Bar(0), NotificationPopups(0)],
    style: "style.css",
});

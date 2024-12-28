import Bar from "widgets/bar/Bar";
import NotificationPopups from "widgets/notifications/Notifications";

App.config({
    onConfigParsed: () => {
        console.log("config parsed!");
    },
    windows: [Bar(1), NotificationPopups(1)],
    style: "style.css",
});

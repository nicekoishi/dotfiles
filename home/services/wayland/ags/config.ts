import Bar from "widgets/bar/Bar";
import NotificationPopups from "widgets/notifications/Notifications";

const Notifications = await Service.import("notifications");

// Utils.timeout(100, () =>
//     Utils.notify({
//         summary: "Notification Popup Example",
//         iconName: "info-symbolic",
//         body:
//       "Lorem ipsum dolor sit amet, qui minim labore adipisicing " +
//       "minim sint cillum sint consectetur cupidatat.",
//         actions: {
//             Cool: () => print("pressed Cool"),
//         },
//     }),
// );

App.addIcons("assets");

App.config({
    windows: [Bar(0), NotificationPopups(0)],
    onConfigParsed: () => {
        console.log("config parsed!");
    },
    style: "style.css",
});

Object.assign(Notifications, {
    popupTimeout: 5000,
    forceTimeout: false,
    cacheAction: true,
});

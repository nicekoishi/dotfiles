const Notifications = await Service.import("notifications");
const { Box, Button, EventBox, Icon, Label, Scrollable, Window } = Widget;
const { lookUpIcon, timeout } = Utils;

Object.assign(Notifications, {
    popupTimeout: 5000,
    forceTimeout: false,
    cacheAction: true,
});

function NotificationIcon({ app_entry, app_icon, image }) {
    if (image) {
        return Box({
            vpack: "start",
            css:
                `background-image: url("${image}");` +
                "background-size: cover;" +
                "background-repeat: no-repeat;" +
                "background-position: center;",
        });
    }

    let icon = "dialog-information-symbolic";

    if (lookUpIcon(app_icon))
        icon = app_icon;
    if (app_entry && lookUpIcon(app_entry))
        icon = app_entry;

    return Box({
        child: Icon(icon),
    });
}

function Notification(n: any) {
    const icon = Box({
        className: "icon",
        vpack: "start",
        child: NotificationIcon(n),
    });

    const title = Label({
        className: "title",
        xalign: 0,
        justification: "left",
        hexpand: true,
        maxWidthChars: 24,
        truncate: "end",
        wrap: true,
        label: n.summary,
        useMarkup: true,
    });

    const scroll = (w: any) =>
        Scrollable({
            className: "notification-scrollable",
            hscroll: "never",
            vscroll: "always",
            css: "min-width: 0.75em; min-height: 3em;",
            child: w,
        });

    const body = Label({
        className: "body",
        hexpand: true,
        useMarkup: true,
        xalign: 0,
        yalign: 0,
        justification: "left",
        label: n.body,
        wrap: true,
    });

    const actions = Box({
        className: "actions",
        children: n.actions.map(({ id, label }) =>
            Button({
                className: "action-button",
                onClicked: () => {
                    n.invoke(id);
                    n.dismiss();
                },
                hexpand: true,
                child: Label(label),
            }),
        ),
    });

    return EventBox(
        {
            attribute: { id: n.id },
            onPrimaryClick: n.dismiss,
        },
        Box(
            {
                className: `notification ${n.urgency}`,
                vertical: true,
            },
            Box({
                className: "info",
                children: [
                    icon,
                    Box({
                        vertical: true,
                        className: "text",
                        vpack: "center",

                        setup: (self) => {
                            if (n.body.length > 0) {
                                if (n.body.length > 140)
                                    self.children = [title, scroll(body)];
                                else
                                    self.children = [title, body];
                            } else {
                                self.children = [title];
                            }
                        },
                    }),
                ],
            }),
            actions,
        ),
    );
}

export default (monitor = 0) => {
    const list = Box({
        vertical: true,
        children: Notifications.popups.map(Notification),
    });

    function onNotified(_: any, id: number) {
        const n = Notifications.getNotification(id);
        if (n)
            list.children = [...list.children, Notification(n)];
        // https://github.com/TheAyes
        let time: number = -1;
        switch (n?.urgency) {
            case "low":
                time = Notifications.popupTimeout / 1.6;
                break;
            case "critical":
                break;
            default:
                time = Notifications.popupTimeout;
                break;
        }

        if (time >= 0)
            timeout(time, () => n?.dismiss());
        // https://discord.com/channels/1143610930542944377/1143612651759489054/1271222981817012297
    }

    function onDismissed(_: any, id: number) {
        list.children.find((n: any) => n.attribute.id === id)?.destroy();
    }

    list.hook(Notifications, onNotified, "notified").hook(
        Notifications,
        onDismissed,
        "dismissed",
    );

    return Window({
        monitor,
        name: `notifications${monitor}`,
        className: "notifications",
        anchor: ["top"],
        margins: [4, 4, 4, 4],
        child: Box({
            // nasty, it's to avoid clipping
            css: "padding: 1px 1px 12px 1px;",
            className: "notifications",
            vertical: true,
            child: list,
        }),
    });
};

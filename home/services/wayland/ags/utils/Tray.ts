/* NOTE: Gtk4 has gtk_widget_set_overflow() but not Gtk3...
 * I just wanted some rounded corners, man... */
import Gdk from "gi://Gdk";

const Tray = await Service.import("systemtray");
const { Button, Icon } = Widget;

export default (self: any) => {
    self.children = Tray.items.map((item: any) =>
        Button({
            className: "trayItem",
            child: Icon({ icon: item.bind("icon") }),
            tooltipMarkup: item.bind("tooltip_markup"),
            /* TODO: Is it possible to get the PID? We could dispatch to workspace of that app */
            onPrimaryClick: (_: any, event: any) => {
                console.info(`${event} suppressed`);
            },
            /* {try {item.activate(event);} catch (error) {console.error("git gud scrub");}, */
            // eslint-disable-next-line max-len
            /* https://github.com/Aylur/dotfiles/blob/18b83b2d2c6ef2b9045edefe49a66959f93b358a/ags/widget/bar/buttons/SysTray.ts#L32 */
            onSecondaryClick: (btn: any) =>
                item.menu?.popup_at_widget(
                    btn,
                    Gdk.Gravity.SOUTH_WEST,
                    Gdk.Gravity.EAST,
                    null,
                ),
        }),
    );
};
